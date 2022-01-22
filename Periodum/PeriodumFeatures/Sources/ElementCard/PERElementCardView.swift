//  PERElementCardView.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit
import Components

public class PERElementCardView: PERView {
    public var model: PERElementCardModel {
        didSet { modelDidChange() }
    }
    
    public let isInverted: Bool
    public init(model: PERElementCardModel, inverse: Bool = false) {
        self.model = model
        self.isInverted = inverse
        super.init()
        modelDidChange()
    }
    
    public override var bounds: CGRect {
        didSet { setNeedsLayout() }
    }
    
    private func modelDidChange() {
        let textColor = self.textColor.cgColor
        
        atomNumberLabel.foregroundColor = textColor
        atomNumberLabel.opacity = 0.6
        atomNumberLabel.string = String(model.number)
        atomNumberLabel.frame.size = atomNumberLabel.preferredFrameSize()
        
        symbolLabel.foregroundColor = textColor
        symbolLabel.string = model.symbol
        symbolLabel.frame.size = symbolLabel.preferredFrameSize()
        
        nameLabel.foregroundColor = isInverted ? textColor : UIColor.white.cgColor
        nameLabel.opacity = 0.6
        nameLabel.string = model.nameTr
        nameLabel.frame.size = nameLabel.preferredFrameSize()
        
        massLabel.foregroundColor = textColor
        massLabel.opacity = 0.6
        massLabel.string = model.atomicMass
        massLabel.frame.size = massLabel.preferredFrameSize()
        
        gradientLayer.colors = gradientColors
        setNeedsLayout()
    }
    
    // MARK: - View Lifecycle
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 85, height: 85)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard let scaleFactor = window?.screen.scale else { return }
        
        print("Scale Factor:", scaleFactor)
        atomNumberLabel.contentsScale = scaleFactor
        symbolLabel.contentsScale = scaleFactor
        nameLabel.contentsScale = scaleFactor
        massLabel.contentsScale = scaleFactor
    }
    
    // MARK: - Coloring
    public override class var layerClass: AnyClass { CAGradientLayer.self }
    private var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    private var gradientColors: [CGColor] {
        let color = UIColor(hex: model.colorCode)
        
        return [
            isInverted
                ? color
                : UIColor(red: 39/255, green: 47/255, blue: 63/255, alpha: 1),
            
            isInverted
                ? color
                : UIColor(red: 29/255, green: 35/255, blue: 47/255, alpha: 1)
        ].map(\.cgColor)
    }
    
    private var textColor: UIColor {
        isInverted ? .black : UIColor(hex: model.colorCode)
    }
    
    // MARK: - View Hierarchy
    private let atomNumberLabel = CATextLayer()
    private let symbolLabel = CATextLayer()
    private let nameLabel = CATextLayer()
    private let massLabel = CATextLayer()

    public override func setupViewHierarchy() {
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 4
        
        layer.addSublayer(atomNumberLabel)
        layer.addSublayer(symbolLabel)
        layer.addSublayer(nameLabel)
        layer.addSublayer(massLabel)
        
        #if targetEnvironment(macCatalyst)
        let symbolFont = UIFont.systemFont(ofSize: 110, weight: .light)
        let smallerFont = UIFont.systemFont(ofSize: 38)
        #else
        let symbolFont = UIFont.systemFont(ofSize: 100, weight: .light)
        let smallerFont = UIFont.systemFont(ofSize: 38)
        #endif
        
        atomNumberLabel.font = smallerFont
        atomNumberLabel.fontSize = smallerFont.pointSize
        atomNumberLabel.string = String(model.number)
        atomNumberLabel.anchorPoint = .zero
        atomNumberLabel.alignmentMode = .natural
        atomNumberLabel.minificationFilter = .trilinear
        atomNumberLabel.frame.size = atomNumberLabel.preferredFrameSize()
        
        symbolLabel.font = symbolFont
        symbolLabel.string = model.symbol
        symbolLabel.fontSize = symbolFont.pointSize
        symbolLabel.anchorPoint = .zero
        symbolLabel.alignmentMode = .natural
        symbolLabel.minificationFilter = .trilinear
        symbolLabel.frame.size = symbolLabel.preferredFrameSize()
        
        nameLabel.font = smallerFont
        nameLabel.fontSize = smallerFont.pointSize
        nameLabel.string = model.nameTr
        nameLabel.anchorPoint = .zero
        nameLabel.alignmentMode = .natural
        nameLabel.minificationFilter = .trilinear
        nameLabel.frame.size = nameLabel.preferredFrameSize()
        
        massLabel.font = smallerFont
        massLabel.fontSize = smallerFont.pointSize
        massLabel.string = model.atomicMass
        massLabel.anchorPoint = .zero
        massLabel.alignmentMode = .natural
        massLabel.minificationFilter = .trilinear
        massLabel.frame.size = massLabel.preferredFrameSize()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let scale = (1 + (bounds.height - 85.0) / 85) * 0.35
        let inset = bounds.insetBy(dx: 20 * scale, dy: 14 * scale)
        
        symbolLabel.transform = CATransform3DMakeScale(scale, scale, 1)
        symbolLabel.position = CGPoint(x: inset.origin.x - 6 * scale, y: inset.origin.y - 20 * scale)
        
        atomNumberLabel.transform = CATransform3DMakeScale(scale, scale, 1)
        atomNumberLabel.position = CGPoint(x: inset.maxX - atomNumberLabel.bounds.width * scale, y: inset.minY)
        
        massLabel.transform = CATransform3DMakeScale(scale, scale, 1)
        var massScale: CGFloat = 1
        if massLabel.frame.width > inset.width {
            massScale = inset.width / massLabel.frame.width
            massLabel.transform = CATransform3DScale(CATransform3DMakeScale(scale, scale, 1), massScale, massScale, 1)
        }
        
        massLabel.position = CGPoint(x: inset.minX, y: inset.maxY - (massLabel.bounds.height * scale) * massScale)
        
        nameLabel.transform = CATransform3DMakeScale(scale, scale, 1)
        var nameScale: CGFloat = 1
        if nameLabel.frame.width > inset.width {
            nameScale = inset.width / nameLabel.frame.width
            nameLabel.transform = CATransform3DScale(CATransform3DMakeScale(scale, scale, 1), nameScale, nameScale, 1)
        }
        
        nameLabel.position = CGPoint(x: inset.minX, y: massLabel.frame.minY - ((nameLabel.bounds.height * scale) * nameScale) - (2 * scale) * nameScale)
    }
}

import SwiftUI
import PeriodumCore

struct Previews_PERElementCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewPreview(
                make: PERElementCardView(
                    model: PERElementCardModel(
                        from: previewHeliumElement
                    ),
                    inverse: true
                )
            )
            
            PERElementCard(
                element: PERElementCardModel(
                    from: previewHeliumElement
                ),
                inverse: true
            )
        }
        .frame(width: 85, height: 85)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

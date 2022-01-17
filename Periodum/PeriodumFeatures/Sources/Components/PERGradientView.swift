//  PERGradientView.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit

open class PERGradientView: PERView {
    public var startPoint = CGPoint(x: 0, y: 0) {
        didSet { updateGradient() }
    }
    
    public var endPoint = CGPoint(x: 0, y: 1) {
        didSet { updateGradient() }
    }
    
    public var colors: [UIColor] = [] {
        didSet { updateGradient() }
    }
    
    public init(direction: Direction = .topToBottom, colors: [UIColor] = [.black, .black.withAlphaComponent(0)]) {
        self.startPoint = direction.startPoint
        self.endPoint = direction.endPoint
        self.colors = colors
        super.init()
        updateGradient()
    }
    
    public enum Direction {
        case topToBottom
        case bottomToTop
        case leftToRight
        case rightToLeft
    }
    
    public override class var layerClass: AnyClass { CAGradientLayer.self }
    public var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    private func updateGradient() {
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
}

public extension PERGradientView.Direction {
    var startPoint: CGPoint {
        switch self {
        case .topToBottom: return .zero
        case .bottomToTop: return CGPoint(x: 0, y: 1)
        case .leftToRight: return .zero
        case .rightToLeft: return CGPoint(x: 1, y: 0)
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .topToBottom: return CGPoint(x: 0, y: 1)
        case .bottomToTop: return .zero
        case .leftToRight: return CGPoint(x: 1, y: 0)
        case .rightToLeft: return CGPoint(x: 0, y: 0)
        }
    }
}

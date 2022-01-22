//  PERPeriodicTableViewController.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit

import PeriodumCore
import Components
import ElementCard

public class PERPeriodicTableViewController: PERViewController {
    public let numberOfRows = 9
    public let numberOfColumns = 18
    
    public var onSelectElement: (Element.ID) -> Void = { _ in }
    
    public let elements: [PERElementCardModel]
    public init(elements: [PERElementCardModel]) {
        self.elements = elements
        super.init()
    }
    
    @objc private func didTapElementCard(_ recognizer: UITapGestureRecognizer) {
        guard let card = recognizer.view else { return }
        let elementID = card.tag
        onSelectElement(elementID)
    }
    
    // MARK: - View Hieararchy
    public lazy var elementCards = elements.map { PERElementCardView(model: $0) }

    public override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(hex: 0x1a1f2a)
        
        for card in elementCards {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapElementCard(_:)))
            card.tag = card.model.id
            card.addGestureRecognizer(tapGesture)
            view.addSubview(card)
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let cardSize = self.cardSize
        for card in elementCards {
            card.frame = slotFrame(for: card.model, size: cardSize).insetBy(dx: 2, dy: 2)
        }
    }
    
    private func slotFrame(for element: PERElementCardModel, size: CGSize) -> CGRect {
        let size = cardSize
        return CGRect(
            origin: CGPoint(
                x: CGFloat(element.col - 1) * size.width,
                y: CGFloat(element.row - 1) * size.height
            ),
            size: size
        )
    }
    
    private var cardSize: CGSize {
        let bounds = view.bounds
        let lengthByWidth = bounds.width / CGFloat(numberOfColumns)
        let lengthByHeight = bounds.height / CGFloat(numberOfRows)
        
        if lengthByWidth * CGFloat(numberOfRows) >= bounds.height {
            return CGSize(width: lengthByHeight, height: lengthByHeight)
        } else {
            return CGSize(width: lengthByWidth, height: lengthByWidth)
        }
    }
}

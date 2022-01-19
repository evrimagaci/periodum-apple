//  PERElementInspectorCell.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit
import Components

class PERElementInspectorCell: PERCollectionViewCell {
    var title: String {
        get { titleLabel.text ?? "" }
        set {
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
    
    var value: String {
        get { valueLabel.text ?? "" }
        set {
            valueLabel.text = newValue
            valueLabel.sizeToFit()
        }
    }
    
    private let titleLabel = UILabel().configure {
        $0.textColor = .secondaryLabel
    }
    
    private let valueLabel = UILabel().configure {
        $0.textColor = .label
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .right
    }
    
    private let separator = UIView().configure {
        $0.backgroundColor = .separator
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(separator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = uiBounds.insetBy(dx: 16, dy: 0)
        titleLabel.frame.size.height = bounds.height
        titleLabel.setTopLeading(to: .zero, in: margins)
        
        valueLabel.frame.size.width = margins.width - titleLabel.bounds.width - 8
        valueLabel.frame.size.height = bounds.height
        valueLabel.setTopTrailing(to: .zero, in: margins)
        
        separator.frame = CGRect(
            origin: CGPoint(x: 0, y: bounds.maxY - 0.5),
            size: CGSize(width: bounds.width, height: 1)
        )
    }
}

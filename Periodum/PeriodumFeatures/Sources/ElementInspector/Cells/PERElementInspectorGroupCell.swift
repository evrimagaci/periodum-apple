//  PERElementInspectorGroupCell.swift
//  Created by Umur Gedik on 23.01.2022.

import UIKit
import Components

class PERElementInspectorGroupCell: PERCollectionViewCell {
    var title: String? {
        get { titleLabel.text }
        set {
            titleLabel.text = newValue
            titleLabel.sizeToFit()
            setNeedsLayout()
        }
    }
    
    var isCollapsed: Bool = true {
        didSet {
            UIView.animate(withDuration: 0.2) { [self] in
                if isCollapsed {
                    disclosureView.transform = CGAffineTransform.identity
                } else {
                    disclosureView.transform = CGAffineTransform(rotationAngle: .pi / 2)
                }
            }
        }
    }
    
    // MARK: - View Hierarchy
    let titleLabel = UILabel().configure {
        $0.textColor = .secondaryLabel
    }
    
    let separator = UIView().configure { $0.backgroundColor = .separator }
    let disclosureView = UIImageView(image: UIImage(systemName: "chevron.right")!).configure {
        $0.tintColor = .systemBlue
        $0.contentMode = .center
        $0.sizeToFit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(disclosureView)
        contentView.addSubview(separator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = uiBounds.insetBy(dx: 16, dy: 0)
        titleLabel.frame.size.height = bounds.height
        titleLabel.setTopLeading(to: .zero, in: margins)
        
        disclosureView.frame.size.height = bounds.height
        disclosureView.frame.size.width = bounds.height
        disclosureView.setTopTrailing(to: CGPoint(x: -bounds.height/2 + disclosureView.image!.size.width / 2, y: 0), in: margins)
        
        separator.frame = CGRect(
            origin: CGPoint(x: 0, y: bounds.maxY - 0.5),
            size: CGSize(width: bounds.width, height: 1)
        )
    }
}

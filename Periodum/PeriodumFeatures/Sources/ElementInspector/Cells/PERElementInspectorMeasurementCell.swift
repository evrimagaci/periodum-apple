//  PERElementInspectorMeasurementCell.swift
//  Created by Umur Gedik on 25.01.2022.

import UIKit

import Components
import PeriodumCore

class PERElementInspectorMeasurementCell: PERCollectionViewCell {
    var title: String? {
        get { titleLabel.text }
        set {
            titleLabel.text = newValue
            titleLabel.sizeToFit()
            setNeedsLayout()
        }
    }
    
    var isChildCell: Bool = false {
        didSet {
            backgroundView?.isHidden = !isChildCell
        }
    }
    
    func setValue(_ value: String, unit: Dimension, allUnits: [Dimension]) {
        measurementView.configure(with: .init(value: value, unit: unit, allUnits: allUnits))
        measurementView.sizeToFit()
        setNeedsLayout()
    }
    
    // MARK: - View Hierarchy
    private let titleLabel = UILabel().configure {
        $0.textColor = .secondaryLabel
        #if !targetEnvironment(macCatalyst)
        $0.font = .preferredFont(forTextStyle: .subheadline, compatibleWith: nil)
        #endif
    }
    
    private let measurementView = PERMeasurementView()
    private let separator = UIView().configure {
        $0.backgroundColor = .separator
    }
    
    override func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(measurementView)
        contentView.addSubview(separator)
        measurementView.onUnitChange = { [weak self] in
            self?.setNeedsLayout()
        }
        
        backgroundView = UIView().configure {
            $0.backgroundColor = .black.withAlphaComponent(0.25)
            $0.isHidden = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = bounds.insetBy(dx: 16, dy: 8)
        titleLabel.frame.size.height = margins.height
        titleLabel.frame.origin = margins.origin
        
        backgroundView?.frame = bounds
        
        measurementView.sizeToFit()
        measurementView.frame.size.height = margins.height
        measurementView.frame.origin.x = margins.maxX - measurementView.frame.size.width
        measurementView.frame.origin.y = margins.midY - measurementView.bounds.midY
        
        separator.frame = CGRect(
            origin: CGPoint(x: 0, y: bounds.maxY - 0.5),
            size: CGSize(width: bounds.width, height: 1)
        )
    }
}

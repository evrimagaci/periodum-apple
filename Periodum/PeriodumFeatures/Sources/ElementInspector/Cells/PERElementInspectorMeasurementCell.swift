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
    }
    
    private let measurementView = PERMeasurementView()
    
    override func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(measurementView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = bounds.insetBy(dx: 16, dy: 0)
        titleLabel.frame.size.height = margins.height
        titleLabel.frame.origin = margins.origin
        
        measurementView.frame.size.height = margins.height
        measurementView.frame.origin.x = margins.maxX - measurementView.frame.size.width
    }
}

//  PERMeasurementView.swift
//  Created by Umur Gedik on 25.01.2022.

import UIKit

import Components

fileprivate let measurementFormatter = MeasurementFormatter().configure { formatter in
    formatter.unitOptions = .providedUnit
}

class PERMeasurementView: PERView {
    private(set) var configuration: Configuration?
    func configure(with configuration: Configuration) {
        self.configuration = configuration
        self.render(configuration)
    }
    
    struct Configuration {
        let value: String
        let unit: Dimension
        let allUnits: [Dimension]
    }
    
    // MARK: - Lifecycle
    private func render(_ configuration: Configuration) {
        guard let value = Double(configuration.value) else { return }
        valueLabel.text = measurementFormatter.numberFormatter.string(for: value)
        unitButton.setTitle(configuration.unit.symbol, for: .normal)
    }
    
    // MARK: - View Hieararchy
    let valueLabel = UILabel()
    let unitButton = UIButton(type: .custom)
    
    override func setupViewHierarchy() {
        addSubview(valueLabel)
        addSubview(unitButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        valueLabel.frame.origin = .zero
        unitButton.frame.origin = CGPoint(x: valueLabel.frame.maxX + 8, y: 0)
    }
    
    override func sizeToFit() {
        valueLabel.sizeToFit()
        unitButton.sizeToFit()
        
        frame.size.width = valueLabel.frame.width + 8 + unitButton.frame.width
    }
}

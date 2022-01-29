//  PERMeasurementView.swift
//  Created by Umur Gedik on 25.01.2022.

import UIKit

import Components

fileprivate let measurementFormatter = MeasurementFormatter().configure { formatter in
    formatter.unitOptions = .providedUnit
    formatter.unitStyle = .long
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .scientific
    numberFormatter.maximumFractionDigits = 5
    formatter.numberFormatter = numberFormatter
//    formatter.numberFormatter.numberStyle = .scientific
}

class PERMeasurementView: PERControl {
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
    override init() {
        super.init()
        addInteraction(UIContextMenuInteraction(delegate: self))
        isContextMenuInteractionEnabled = true
    }
    
    public var onUnitChange: () -> Void = { }
    private var selectedUnit: Dimension?
    private func render(_ configuration: Configuration) {
        guard let value = Double(configuration.value) else {
            isHidden = true
            return
        }
        
        isHidden = false
        let measurement = Measurement(value: value, unit: configuration.unit)
        
        selectedUnit = configuration.unit
        
        valueLabel.text = measurementFormatter.numberFormatter.string(for: measurement.value)
        unitLabel.text = configuration.unit.symbol
    }
    
    // MARK: - Units
    private func buildUnitMenuChildren() -> [UIAction] {
        guard
            let selectedUnit = selectedUnit,
            let configuration = configuration
        else {
            return []
        }

        return configuration.allUnits.map { unit in
            UIAction(
                title: unit.symbol,
                identifier: UIAction.Identifier(rawValue: unit.symbol),
                state: unit == selectedUnit ? .on : .off
            ) { [weak self] _ in
                self?.setMeasurementUnit(unit)
            }
        }
    }
    
    private func buildUnitsMenu() -> UIMenu {
        UIMenu(title: "Units", children: buildUnitMenuChildren())
    }
    
    private func setMeasurementUnit(_ unit: Dimension) {
        guard
            let configuration = configuration,
            let value = Double(configuration.value)
        else {
            return
        }
        
        selectedUnit = unit
        let measurement = Measurement(value: value, unit: configuration.unit)
        let converted = measurement.converted(to: unit)
        valueLabel.text = measurementFormatter.numberFormatter.string(for: converted.value)
        unitLabel.text = unit.symbol
        
        onUnitChange()
    }
    
    override func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            return self?.buildUnitsMenu()
        }
    }
    
    // MARK: - View Hieararchy
    let valueLabel = UILabel().configure {
        #if !targetEnvironment(macCatalyst)
        $0.font = .preferredFont(forTextStyle: .subheadline, compatibleWith: nil)
        #endif
    }
    
    let unitLabel = UILabel().configure {
        #if !targetEnvironment(macCatalyst)
        $0.font = .preferredFont(forTextStyle: .subheadline, compatibleWith: nil)
        $0.textColor = .systemBlue
        #endif
    }
    
    lazy var highlight = UIView().configure {
        $0.backgroundColor = .quaternarySystemFill
        $0.layer.cornerCurve = .continuous
        $0.layer.cornerRadius = 6
        $0.isHidden = true
    }
    
    override func setupViewHierarchy() {
        addSubview(highlight)
        addSubview(valueLabel)
        addSubview(unitLabel)
        
        let hoverGesture = UIHoverGestureRecognizer(target: self, action: #selector(handleHoverGesture(_:)))
        addGestureRecognizer(hoverGesture)
        
        showsMenuAsPrimaryAction = true
    }
    
    @objc private func handleHoverGesture(_ gestureRecognizer: UIHoverGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began, .changed:
            highlight.isHidden = false
        case .ended:
            highlight.isHidden = true
        default:
            break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        valueLabel.frame.origin = .zero
        valueLabel.frame.size.height = bounds.height
        
        unitLabel.frame.origin = CGPoint(x: valueLabel.frame.maxX + 4, y: 0)
        unitLabel.frame.size.height = bounds.height
        
        highlight.frame = bounds.insetBy(dx: -8, dy: 0)
    }
    
    override func sizeToFit() {
        valueLabel.sizeToFit()
        unitLabel.sizeToFit()
        
        frame.size.width = valueLabel.frame.width + 4 + unitLabel.frame.width
    }
}

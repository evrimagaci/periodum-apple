//  Concentration.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

public extension UnitConcentrationMass {
    static let kilogramsPerCubicMeter = gramsPerLiter
    static let kilogramsPerCubicCentimeter = UnitConcentrationMass(symbol: "kg/cm3", converter: UnitConverterLinear(coefficient: 1000000))
    static let gramsPerCubicCentimeter = UnitConcentrationMass(symbol: "g/cm3", converter: UnitConverterLinear(coefficient: 1000))
    
    static let elementUnits: [UnitConcentrationMass] = [
        kilogramsPerCubicMeter,
        kilogramsPerCubicCentimeter,
        gramsPerCubicCentimeter
    ]
}

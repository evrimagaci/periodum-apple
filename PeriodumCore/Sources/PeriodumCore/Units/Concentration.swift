//  Concentration.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

extension UnitConcentrationMass: ElementDimension {
    public static let kilogramsPerLiter = UnitConcentrationMass(symbol: "kg/L", converter: UnitConverterLinear(coefficient: 1000))
    public static let kilogramsPerCubicMeter = UnitConcentrationMass(symbol: "kg/m3", converter: gramsPerLiter.converter)
    public static let kilogramsPerCubicCentimeter = UnitConcentrationMass(symbol: "kg/cm3", converter: UnitConverterLinear(coefficient: 1000000))
    public static let gramsPerCubicCentimeter = UnitConcentrationMass(symbol: "g/cm3", converter: UnitConverterLinear(coefficient: 1000))
    
    public static let elementUnits: [UnitConcentrationMass] = [
        kilogramsPerCubicMeter,
        kilogramsPerCubicCentimeter,
        kilogramsPerLiter,
        gramsPerCubicCentimeter
    ]
}

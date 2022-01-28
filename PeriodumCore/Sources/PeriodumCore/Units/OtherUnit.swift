//  OtherUnit.swift
//  Created by Umur Gedik on 29.01.2022.

import Foundation

public final class SpecificHeatUnit: Dimension, ElementDimension {
    public static let joulesPerMolK = SpecificHeatUnit(symbol: "J/molK", converter: UnitConverterLinear(coefficient: 1))
    public static var elementUnits: [SpecificHeatUnit] { [baseUnit()] }
    
    public override class func baseUnit() -> SpecificHeatUnit {
        joulesPerMolK
    }
}

public final class SpecificHeatCapacityUnit: Dimension, ElementDimension {
    public static var elementUnits: [SpecificHeatCapacityUnit] { [_baseUnit] }
    
    public static let _baseUnit = SpecificHeatCapacityUnit(symbol: "J/gK", converter: UnitConverterLinear(coefficient: 1))
    public override class func baseUnit() -> SpecificHeatCapacityUnit {
        _baseUnit
    }
}

public final class ThermalConductivityUnit: Dimension, ElementDimension {
    public static var elementUnits: [ThermalConductivityUnit] { [_baseUnit] }

    public static let _baseUnit = ThermalConductivityUnit(symbol: "W/m*K", converter: UnitConverterLinear(coefficient: 1))
    public override class func baseUnit() -> ThermalConductivityUnit {
        _baseUnit
    }
}

public final class ThermalExpansionUnit: Dimension, ElementDimension {
    public static var elementUnits: [ThermalExpansionUnit] { [_baseUnit] }
    public static let _baseUnit = ThermalExpansionUnit(symbol: "m/m*K", converter: UnitConverterLinear(coefficient: 1))
    public override class func baseUnit() -> ThermalExpansionUnit {
        _baseUnit
    }
}

public final class ResistivityUnit: Dimension, ElementDimension {
    public static var elementUnits: [ResistivityUnit] { [_baseUnit] }
    public static let _baseUnit = ResistivityUnit(symbol: "nΩm", converter: UnitConverterLinear(coefficient: 1))
    public override class func baseUnit() -> ResistivityUnit {
        _baseUnit
    }
}

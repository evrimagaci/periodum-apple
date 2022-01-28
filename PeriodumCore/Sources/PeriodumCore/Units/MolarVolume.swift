//  MolarVolume.swift
//  Created by Umur Gedik on 29.01.2022.

import Foundation

public class UnitMolarVolume: Dimension, ElementDimension {
    public static let cubicCentimetersPerMol = UnitMolarVolume(symbol: "cm3/mol", converter: UnitConverterLinear(coefficient: 1))
    
    public static let baseUnit = cubicCentimetersPerMol
    public static var elementUnits: [UnitMolarVolume] = [baseUnit]
}

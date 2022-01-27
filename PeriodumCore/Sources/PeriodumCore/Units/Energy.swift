//  Energy.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

public class UnitEnergyPerMole: Dimension, ElementDimension {
    public static let baseUnit = kilojoulePerMole
    
    public static let kilojoulePerMole = UnitEnergyPerMole(symbol: "kJ/mol", converter: UnitConverterLinear(coefficient: 1))
    public static let electronVolts = UnitEnergyPerMole(symbol: "eV", converter: UnitConverterLinear(coefficient: 96.4915666370759))
    public static let kilocaloriesPerMole = UnitEnergyPerMole(symbol: "kcal/mol", converter: UnitConverterLinear(coefficient: 4.1839953808691))
    
    public static let elementUnits: [UnitEnergyPerMole] = [
        kilojoulePerMole, electronVolts, kilocaloriesPerMole
    ]
}

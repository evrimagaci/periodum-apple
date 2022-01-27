//  Temperature.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

extension UnitTemperature: ElementDimension {
    public static let rankine = UnitTemperature(symbol: "°R", converter: UnitConverterLinear(coefficient: 1.8))
    public static let reamur = UnitTemperature(symbol: "°r", converter: UnitConverterLinear(coefficient: 5.0/4.0, constant: 273.15))
    
    public static let elementUnits: [UnitTemperature] = [
        kelvin, celsius, fahrenheit, rankine, reamur
    ]
}

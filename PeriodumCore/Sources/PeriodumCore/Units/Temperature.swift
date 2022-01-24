//  Temperature.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

public extension UnitTemperature {
    static let rankine = UnitTemperature(symbol: "°R", converter: UnitConverterLinear(coefficient: 1.8))
    static let reamur = UnitTemperature(symbol: "°r", converter: UnitConverterLinear(coefficient: 5.0/4.0, constant: 273.15))
    
    static let elementUnits: [UnitTemperature] = [
        kelvin, celsius, fahrenheit, rankine, reamur
    ]
}

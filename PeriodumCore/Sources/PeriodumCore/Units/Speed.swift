//  Speed.swift
//  Created by Umur Gedik on 29.01.2022.

import Foundation

extension UnitSpeed: ElementDimension {
    public static let light = UnitSpeed(symbol: "c", converter: UnitConverterLinear(coefficient: 299792458))
    
    public static let elementUnits: [UnitSpeed] = [
        metersPerSecond,
        kilometersPerHour,
        milesPerHour,
        light
    ]
}

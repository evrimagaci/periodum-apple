//  Volume.swift
//  Created by Umur Gedik on 24.01.2022.

import Foundation

extension UnitVolume: ElementDimension {
    public static let elementUnits: [UnitVolume] = [
        cubicCentimeters,
        liters,
        cubicMillimeters
    ]
}

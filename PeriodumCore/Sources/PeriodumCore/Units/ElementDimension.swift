//  ElementDimension.swift
//  Created by Umur Gedik on 25.01.2022.

import Foundation

public protocol ElementDimension: Dimension {
    associatedtype UnitType: Dimension = Self
    static var elementUnits: [UnitType] { get }
}

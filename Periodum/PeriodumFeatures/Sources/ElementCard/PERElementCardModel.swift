//  PERElementCardModel.swift
//  Created by Umur Gedik on 17.01.2022.

import Foundation
import SwiftUI

import PeriodumCore

public struct PERElementCardModel: Hashable, Identifiable {
    public var id: Int { number }
    
    public let number: Int
    public let symbol: String
    public let nameTr: String
    public let atomicMass: String
    public let colorCode: UInt
    public let row: Int
    public let col: Int
    
    public init(number: Int, symbol: String, nameTr: String, atomicMass: String, colorCode: UInt, row: Int, col: Int) {
        self.number = number
        self.symbol = symbol
        self.nameTr = nameTr
        self.atomicMass = atomicMass
        self.colorCode = colorCode
        self.row = row
        self.col = col
    }
}

public extension PERElementCardModel {
    init(from element: Element) {
        number = element.number
        symbol = element.symbol
        nameTr = element.nameTr
        atomicMass = element.atomicMass
        colorCode = element.style.colorCode
        row = element.ypos ?? 0
        col = element.xpos ?? 0
    }
}

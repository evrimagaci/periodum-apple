//  PeriodicTableElementViewModel.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import Foundation
import SwiftUI

import PeriodumCore

public struct PeriodicTableElementViewModel: Hashable, Identifiable {
    public var id: Int { number }
    
    let number: Int
    let symbol: String
    let nameTr: String
    let atomicMass: String
    let color: Color
    let row: Int
    let col: Int
}

public extension PeriodicTableElementViewModel {
    init(from element: Element) {
        number = element.number
        symbol = element.symbol
        nameTr = element.nameTr
        atomicMass = element.atomicMass
        color = element.style.color
        row = element.ypos ?? 0
        col = element.xpos ?? 0
    }
}

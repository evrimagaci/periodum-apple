//  Element+Style.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import Foundation
import SwiftUI

import PeriodumCore

public extension Element {
    var style: ElementStyle { ElementStyle(from: self) }
}

public struct ElementStyle {
    public let kind: Kind
    public let color: Color
    
    init(from element: Element) {
        kind = Kind(rawValue: element.category) ?? .other
        switch kind {
        case .nonMetallic:
            color = Color(hex: 0xff80d4)
        case .alkalineMetal:
            color = Color(hex: 0xffaf80)
        case .alkalineEarthMetal:
            color = Color(hex: 0x80ff8e)
        case .transitionMetal:
            color = Color(hex: 0xffef80)
        case .halfMetal:
            color = Color(hex: 0x8095ff)
        case .metal:
            color = Color(hex: 0x80d5ff)
        case .nobleGas:
            color = Color(hex: 0xaa80ff)
        case .actinide:
            color = Color(hex: 0x80fffc)
        case .lanthanide:
            color = Color(hex: 0xc3ff80)
        case .other:
            color = Color(hex: 0xd4dadc)
        }
    }
    
    public enum Kind: String {
        case nonMetallic = "reaktif ametal"
        case alkalineMetal = "alkali metal"
        case alkalineEarthMetal = "toprak alkali metal"
        case transitionMetal = "geçiş metali"
        case halfMetal = "metalsi"
        case metal = "geçiş sonrası metali"
        case nobleGas = "soy gaz"
        case actinide = "aktinit"
        case lanthanide = "lantanit"
        case other = "bilinmiyor"
    }
}

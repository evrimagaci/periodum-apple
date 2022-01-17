//  Element+Style.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import Foundation

public extension Element {
    var style: ElementStyle { ElementStyle(from: self) }
}

public struct ElementStyle {
    public let kind: Kind
    public let colorCode: UInt
    
    public init(kind: Kind) {
        self.kind = kind
        self.colorCode = kind.colorCode
    }
    
    public init(from element: Element) {
        kind = Kind(rawValue: element.category) ?? .other
        colorCode = kind.colorCode
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
        
        public var colorCode: UInt {
            switch self {
            case .nonMetallic:
                return 0xff80d4
            case .alkalineMetal:
                return 0xffaf80
            case .alkalineEarthMetal:
                return 0x80ff8e
            case .transitionMetal:
                return 0xffef80
            case .halfMetal:
                return 0x8095ff
            case .metal:
                return 0x80d5ff
            case .nobleGas:
                return 0xaa80ff
            case .actinide:
                return 0x80fffc
            case .lanthanide:
                return 0xc3ff80
            case .other:
                return 0xd4dadc
            }
        }
    }
}

//  PERElementInspectorRow.swift
//  Created by Umur Gedik on 19.01.2022.

import Foundation
import PeriodumCore

struct PERElementInspectorRow: Hashable {
    let title: String
    let value: String
    
    var children: [Self] = []
    var isChild = false
    
    var unit: Dimension?
    var allUnits: [Dimension] = []
    
    static func regular(_ title: String, value: String) -> Self {
        .init(title: title, value: value)
    }
    
    static func group(_ title: String, children: [Self]) -> Self {
        let children = children.compactMap { child -> Self? in
            if child.value.isEmpty { return nil }
            
            var child = child
            child.isChild = true
            return child
        }
        
        var row = Self(title: title, value: "")
        row.children = children
        return row
    }
    
    static func measurement<UnitType: ElementDimension>(_ title: String, value: String, unit: UnitType) -> Self {
        var row = Self(title: title, value: value)
        row.unit = unit
        row.allUnits = UnitType.elementUnits
        return row
    }
}

//  PERElementInspectorRow.swift
//  Created by Umur Gedik on 19.01.2022.

import Foundation

struct PERElementInspectorRow: Hashable {
    let title: String
    let value: String
    
    var children: [Self] = []
    var isChild = false
    
    static func regular(_ title: String, value: String) -> Self {
        .init(title: title, value: value)
    }
    
    static func group(_ title: String, children: [Self]) -> Self {
        let children = children.map { child -> Self in
            var child = child
            child.isChild = true
            return child
        }
        
        var row = Self(title: title, value: "")
        row.children = children
        return row
    }
}

//  PERElementInspectorRow.swift
//  Created by Umur Gedik on 19.01.2022.

import Foundation

struct PERElementInspectorRow: Hashable {
    let title: String
    let value: String
    
    static func regular(_ title: String, value: String) -> Self {
        .init(title: title, value: value)
    }
}

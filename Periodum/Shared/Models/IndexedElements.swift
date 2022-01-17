//  IndexedElements.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import Foundation
import PeriodumCore


public struct IndexedElements {
    struct Position: Hashable {
        let row: Int
        let column: Int
    }
    
    let storage: [Position: Element]
    public init(from elements: [Element]) {
        var storage: [Position: Element] = [:]
        for element in elements {
            if let row = element.ypos, let col = element.xpos {
                storage[Position(row: row + 1, column: col + 1)] = element
            }
        }
        
        self.storage = storage
    }
    
    public subscript(row: Int, col: Int) -> Element? {
        storage[Position(row: row, column: col)]
    }
}

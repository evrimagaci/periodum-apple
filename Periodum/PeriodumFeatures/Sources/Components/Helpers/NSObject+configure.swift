//  NSObject+configure.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import Foundation

public protocol Configurable { }

public extension Configurable {
    func configure(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Configurable { }

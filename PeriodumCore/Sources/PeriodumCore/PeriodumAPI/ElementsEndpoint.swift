//  ElementsEndpoint.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public struct ElementsEndpoint: Endpoint {
    public typealias Response = [Element]
    public let path: String = "/elements"
}

public extension Endpoint where Self == ElementsEndpoint {
    static var elements: ElementsEndpoint { ElementsEndpoint() }
}

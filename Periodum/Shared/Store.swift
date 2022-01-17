//
//  Store.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import Foundation
import PeriodumCore

@MainActor
public class Store: ObservableObject {
    @Published public var elements: Loadable<[Element]> = .idle
    private let api: PeriodumAPI
    public init(api: PeriodumAPI) {
        self.api = api
    }
    
    public func element(byID id: Element.ID) -> Element? {
        guard case let .successful(elements) = elements else {
            return nil
        }
        
        return elements.first { $0.id == id }
    }
    
    public func fetchElements() async throws {
        do {
            let items = try await api.fetch(.elements)
            self.elements = .successful(items)
        } catch {
            elements = .failure(error)
        }
    }
}

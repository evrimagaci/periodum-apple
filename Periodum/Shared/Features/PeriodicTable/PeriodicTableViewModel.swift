//  PeriodicTableViewModel.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import Foundation
import PeriodumCore

@MainActor
public class PeriodicTableViewModel: ObservableObject {
    @Published public var elements: Loadable<[PeriodicTableElementViewModel]> = .idle
    
    private let store: Store
    public init(store: Store) {
        self.store = store
        
        store.$elements.map { loadable in
            loadable.mapElements(PeriodicTableElementViewModel.init(from:))
        }
        .assign(to: &$elements)
    }
    
    public func viewDidAppear() {
        Task { try await store.fetchElements() }
    }
}

//  PeriodicTableViewModel.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import Foundation
import PeriodumCore

@MainActor
public class PeriodicTableViewModel: ObservableObject {
    @Published public var elements: Loadable<[Element]> = .idle
    
    private let api: PeriodumAPI
    public init(api: PeriodumAPI) {
        self.api = api
    }
    
    public func viewDidAppear() {
        elements = .loading
        Task {
            do {
                print("Will load elements from the API endpoint")
                let items = try await api.fetch(.elements)
                self.elements = .successful(items)
                print("Elements did load:", items.count)
            } catch {
                elements = .failure(error)
            }
        }
    }
}

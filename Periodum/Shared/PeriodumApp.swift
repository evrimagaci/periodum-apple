//
//  PeriodumApp.swift
//  Shared
//
//  Created by Umur Gedik on 16.01.2022.
//

import SwiftUI

@main
@MainActor
struct PeriodumApp: App {
    let application = Application(config: .default)
    var body: some Scene {
        WindowGroup {
            PeriodicTableView(viewModel: application.periodicTableViewModel)
        }
    }
}

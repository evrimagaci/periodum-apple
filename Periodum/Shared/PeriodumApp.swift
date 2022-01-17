//  PeriodumApp.swift
//  Shared
//  Created by Umur Gedik on 16.01.2022.

import SwiftUI
import PeriodumCore

@main
@MainActor
struct PeriodumApp: App {
    let application = Application(config: .default)
    var body: some Scene {
        WindowGroup {
            MainView(application: application)
                .background(Color(hex: 0x1a1f2a).edgesIgnoringSafeArea(.all))
        }
    }
}

struct FocusedElementValue: FocusedValueKey {
    typealias Value = Element
}

extension FocusedValues {
    var element: Element? {
        get { self[FocusedElementValue.self] }
        set { self[FocusedElementValue.self] = newValue }
    }
}

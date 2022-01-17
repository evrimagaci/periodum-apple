//  MainView.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import SwiftUI
import PeriodumCore

@MainActor
struct MainView: View {
    let application: Application
    
    @State var selectedElementID: Element.ID?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            PeriodicTableView(viewModel: application.periodicTableViewModel, selection: $selectedElementID)
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            selectedElementID = nil
                        } label: {
                            Label("Toggle Inspector", systemImage: "sidebar.trailing")
                        }
                    }
                }

            if let element = selectedElement {
                let isShownBinding = Binding<Bool>(get: { selectedElementID != nil }, set: { _ in selectedElementID = nil })
                ElementInspector(element: element, isShown: isShownBinding)
                    .frame(width: 300)
                    .cornerRadius(12)
                    .shadow(radius: 20)
                    .padding()
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .animation(.default, value: selectedElement)
    }
    
    var selectedElement: Element? {
        guard let id = selectedElementID else { return nil }
        return application.store.element(byID: id)
    }
}

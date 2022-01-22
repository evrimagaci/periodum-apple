//  MainView.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 17.01.2022.

import SwiftUI

import PeriodumCore
import ElementInspector

@MainActor
struct MainView: View {
    let application: Application
    
    @State private var selectedElementID: Element.ID?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            PeriodicTableView(viewModel: application.periodicTableViewModel, selection: $selectedElementID)
                .padding()
                .padding(.bottom, 100)
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
                PERElementInspector(element: element, onDismiss: { selectedElementID = nil })
                    .frame(width: 300)
                    .cornerRadius(12)
                    .shadow(radius: 20)
                    .padding()
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .background(Color(hex: 0x1a1f2a).edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
        .animation(.default, value: selectedElement)
    }
    
    var selectedElement: Element? {
        guard let id = selectedElementID else { return nil }
        return application.store.element(byID: id)
    }
}

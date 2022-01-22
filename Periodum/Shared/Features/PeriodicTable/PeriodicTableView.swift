//  PeriodicTableView.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import SwiftUI
import Components

import PeriodicTable

struct PeriodicTableView: View {
    @ObservedObject var viewModel: PeriodicTableViewModel
    @Binding var selection: Element.ID?
    
    var body: some View {
        PERLoadingView(viewModel.elements) { elements in
            PeriodicTable.PERPeriodicTableView(elements: elements, selection: $selection)
//            PeriodicTableGridView(elements: elements, selection: $selection)
        }
        .onAppear { viewModel.viewDidAppear() }
    }
}

#if DEBUG
import PeriodumCore
struct PeriodicTable_Previews: PreviewProvider {
    static var previews: some View {
        PeriodicTableView(
            viewModel: PeriodicTableViewModel(store: Store(api: .noopMock)),
            selection: .constant(nil)
        )
    }
}
#endif

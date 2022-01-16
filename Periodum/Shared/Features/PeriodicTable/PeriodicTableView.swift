//  PeriodicTableView.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import SwiftUI

struct PeriodicTableView: View {
    @ObservedObject var viewModel: PeriodicTableViewModel
    var body: some View {
        LoadingContent(viewModel.elements) { elements in
            List(elements) { element in
                Text(element.nameTr)
            }
        }.onAppear { viewModel.viewDidAppear() }
    }
}

#if DEBUG
import PeriodumCore
struct PeriodicTable_Previews: PreviewProvider {
    static var previews: some View {
        PeriodicTableView(
            viewModel: PeriodicTableViewModel(api: .noopMock)
        )
    }
}
#endif

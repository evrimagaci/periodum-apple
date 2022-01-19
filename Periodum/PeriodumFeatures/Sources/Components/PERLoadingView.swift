//  PERLoadingView.swift
//  Created by Umur Gedik on 16.01.2022.

import SwiftUI
import PeriodumCore

public struct PERLoadingView<Content, ContentView: View>: View {
    let loadable: Loadable<Content>
    let content: (Content) -> ContentView
    
    public init(_ loadable: Loadable<Content>, @ViewBuilder content: @escaping (Content) -> ContentView) {
        self.loadable = loadable
        self.content = content
    }
    
    public var body: some View {
        switch loadable {
        case .idle:
            Color.clear
        case .loading:
            ProgressView()
        case .successful(let content):
            self.content(content)
        case .failure(let error):
            Text("An error occured")
                .foregroundColor(.red)
        }
    }
}

struct LoadingContent_Previews: PreviewProvider {
    struct PreviewError: Error { }
    static var previews: some View {
        Group {
            PERLoadingView(Loadable<Void>.failure(PreviewError())) { }
        }
    }
}

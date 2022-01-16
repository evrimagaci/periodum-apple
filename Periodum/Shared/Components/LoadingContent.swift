//
//  LoadingContent.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 16.01.2022.
//

import SwiftUI
import PeriodumCore

struct LoadingContent<Content, ContentView: View>: View {
    public let loadable: Loadable<Content>
    public let content: (Content) -> ContentView
    
    public init(_ loadable: Loadable<Content>, @ViewBuilder content: @escaping (Content) -> ContentView) {
        self.loadable = loadable
        self.content = content
    }
    
    var body: some View {
        switch loadable {
        case .idle:
            EmptyView()
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
            LoadingContent(Loadable<Void>.failure(PreviewError())) { }
        }
    }
}

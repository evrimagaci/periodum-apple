//
//  ElementInspectorRow.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import SwiftUI

struct ElementInspectorRow: View {
    let label: String
    let value: String
    
    init(_ label: String, value: String) {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
        }
        #if targetEnvironment(macCatalyst)
        .font(.body)
        #else
        .font(.subheadline)
        #endif
    }
}

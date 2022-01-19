//  PERElementInspector.swift
//  Created by Umur Gedik on 19.01.2022.

import SwiftUI
import PeriodumCore

public struct PERElementInspector: UIViewControllerRepresentable {
    let element: Element
    let onDismiss: () -> Void
    public init(element: Element, onDismiss: @escaping () -> Void) {
        self.element = element
        self.onDismiss = onDismiss
    }
    
    public func makeUIViewController(context: Context) -> PERElementInspectorViewController {
        PERElementInspectorViewController(element: element, onDismiss: onDismiss)
    }
    
    public func updateUIViewController(_ uiViewController: PERElementInspectorViewController, context: Context) {
        uiViewController.element = element
    }
}

//  PERPeriodicTableView.swift
//  Created by Umur Gedik on 21.01.2022.

import UIKit
import SwiftUI

import PeriodumCore
import ElementCard

public struct PERPeriodicTableView: UIViewControllerRepresentable {
    let elements: [PERElementCardModel]
    let selection: Binding<Element.ID?>
    public init(elements: [PERElementCardModel], selection: Binding<Element.ID?>) {
        self.elements = elements
        self.selection = selection
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    public func makeUIViewController(context: Context) -> PERPeriodicTableViewController {
        let vc = PERPeriodicTableViewController(elements: elements)
        vc.onSelectElement = context.coordinator.onSelect(_:)
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: PERPeriodicTableViewController, context: Context) {
        context.coordinator.parent = self
    }
    
    public class Coordinator {
        var parent: PERPeriodicTableView
        init(parent: PERPeriodicTableView) {
            self.parent = parent
        }
        
        func onSelect(_ elementID: Element.ID) {
            parent.selection.wrappedValue = elementID
        }
    }
}

//  ElementInspectorViewController.swift
//  Created by Umur Gedik on 17.01.2022.

import UIKit
import SwiftUI

import PeriodumCore
import Components
import ElementCard

public class ElementInspectorViewController: PERViewController {
    public var element: Element {
        didSet {
            if isViewLoaded {
                renderElement()
            }
        }
    }
    
    // MARK: - Lifecycle
    public init(element: Element) {
        self.element = element
        super.init()
    }
    
    private func renderElement() {
        let cardView = PERElementCard(element: .init(from: element), inverse: true)
        elementCardHosting.rootView = cardView
    }
    
    // MARK: - View Hierarchy
    private lazy var elementCardHosting = UIHostingController(
        rootView: PERElementCard(
            element: .init(from: element),
            inverse: true
        )
    )
    
    public override func loadView() {
        view = UIView()
    }
}

#if DEBUG
import SwiftUI
import PeriodumCore

struct ElementInspectorView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview(
            make: ElementInspectorViewController(
                element: previewHeliumElement
            )
        )
    }
}
#endif

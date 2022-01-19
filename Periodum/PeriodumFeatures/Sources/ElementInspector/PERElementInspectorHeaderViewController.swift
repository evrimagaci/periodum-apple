//  PERElementInspectorHeaderViewController.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit
import SwiftUI

import PeriodumCore
import Components
import ElementCard

class PERElementInspectorHeaderViewController: PERViewController {
    var element: Element {
        didSet {
            cardHost.rootView = PERElementCard(element: PERElementCardModel(from: element), inverse: true)
        }
    }

    let onDismiss: () -> Void
    init(element: Element, onDismiss: @escaping () -> Void) {
        self.element = element
        self.onDismiss = onDismiss
        super.init()
    }
    
    @objc private func didTapDismissButton(_ sender: UIButton) {
        onDismiss()
    }

    // MARK: - View Hierarchy
    private lazy var dismissButton = UIButton(type: .system).configure {
        $0.setImage(UIImage(systemName: "sidebar.left"), for: .normal)
        $0.accessibilityLabel = "Close detailed information"
        $0.addTarget(self, action: #selector(didTapDismissButton(_:)), for: .touchUpInside)
    }
    private lazy var cardHost = UIHostingController(rootView: PERElementCard(element: PERElementCardModel(from: element), inverse: true))
    override func loadView() {
        view = UIView()
        view.frame.size.height = 85 + 16 + 16
        
        add(cardHost)
        cardHost.view.backgroundColor = .clear
        cardHost.view.frame.size = CGSize(width: 85, height: 85)
        
        view.addSubview(dismissButton)
        dismissButton.sizeToFit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let margins = view.uiBounds.insetBy(dx: 16, dy: 16)
        cardHost.view.setTopLeading(to: .zero, in: margins)
        dismissButton.setTopTrailing(to: .zero, in: margins)
    }
}

//  PERElementInspectorViewController.swift
//  Created by Umur Gedik on 17.01.2022.

import UIKit
import SwiftUI

import PeriodumCore
import Components
import ElementCard

public class PERElementInspectorViewController: PERViewController {
    public var element: Element {
        didSet {
            if isViewLoaded {
                renderElement()
            }
        }
    }
    
    private let onDismiss: () -> Void
    // MARK: - Lifecycle
    public init(element: Element, onDismiss: @escaping () -> Void) {
        self.element = element
        self.onDismiss = onDismiss
        super.init()
    }
    
    private func renderElement() {
        let rows: [PERElementInspectorRow] = [
            .regular("Turkce Isim:", value: element.nameTr),
            .regular("Ingilizce Isim:", value: element.nameEn),
            .regular("Sembol:", value: element.symbol),
            .regular("Atom Numarasi:", value: String(element.number)),
            .regular("Gaz Fazi:", value: String(element.gasPhase)),
            .regular("Allotrop İsimleri:", value: element.allotropeNames),
            .regular("Görünüm:", value: element.appearance),
            .regular("Kırılma İndisi:", value: element.refractiveIndex),
            .group("Tanimlayici Numaralar:", children: [
                .regular("CAS Numarasi:", value: element.casNumber),
                .regular("CID Numarasi:", value: element.cidNumber),
                .regular("DOT Numarasi:", value: element.dotNumber),
                .regular("RTECS Numarasi:", value: element.rtecsNumber),
                .regular("Mendeleev Numarasi:", value: element.mendeleevNumber.map(String.init) ?? "")
            ]),
            .group("Kutle", children: [
                .measurement("Atomik Kutle:", value: element.atomicMass, unit: UnitMass.atomicMassUnit)
            ])
        ]
        
        listViewController.rows = rows
        headerViewController.element = element
    }
    
    // MARK: - View Hierarchy
    private lazy var backgroundBlur = UIVisualEffectView(effect: UIBlurEffect(style: .systemThickMaterial))
    private lazy var listViewController = PERElementInspectorListViewController()
    private lazy var headerViewController = PERElementInspectorHeaderViewController(element: element, onDismiss: onDismiss)
    
    public override func loadView() {
        view = backgroundBlur
        
        add(headerViewController, parentView: backgroundBlur.contentView)
        add(listViewController, parentView: backgroundBlur.contentView)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let (headerRect, listRect) = view.bounds.divided(atDistance: headerViewController.view.bounds.height, from: .minYEdge)
        headerViewController.view.frame = headerRect
        listViewController.view.frame = listRect
    }
}

#if DEBUG
import SwiftUI
import PeriodumCore

struct ElementInspectorView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview(
            make: PERElementInspectorViewController(
                element: previewHeliumElement,
                onDismiss: { }
            )
        )
    }
}
#endif

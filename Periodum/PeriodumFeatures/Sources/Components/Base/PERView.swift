//  PERView.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit
import SwiftUI

open class PERView: UIView {
    public init() {
        super.init(frame: .zero)
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupViewHierarchy() { }
}

public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    public let make: () -> View
    public init(make: @escaping () -> View) {
        self.make = make
    }
    
    public init(make: @autoclosure @escaping () -> View) {
        self.make = make
    }
    
    public func makeUIView(context: Context) -> View {
        make()
    }
    
    public func updateUIView(_ uiViewController: View, context: Context) {
        
    }
}

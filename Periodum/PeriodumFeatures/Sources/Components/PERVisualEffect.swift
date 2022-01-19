//  PERVisualEffect.swift
//  Created by Umur Gedik on 17.01.2022.

import SwiftUI

public struct PERVisualEffect: UIViewRepresentable {
    let effect: UIVisualEffect
    public init(effect: UIVisualEffect) {
        self.effect = effect
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: effect)
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

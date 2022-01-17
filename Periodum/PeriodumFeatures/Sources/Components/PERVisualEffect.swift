//  PERVisualEffect.swift
//  Created by Umur Gedik on 17.01.2022.

import SwiftUI

struct PERVisualEffect: UIViewRepresentable {
    let effect: UIVisualEffect
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

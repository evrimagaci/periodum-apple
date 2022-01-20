//  PERElementCardView.swift
//  Created by Umur Gedik on 19.01.2022.

import UIKit
import Components

public class PERElementCardView: PERView {
    public let model: PERElementCardModel
    public init(model: PERElementCardModel) {
        self.model = model
        super.init()
    }
    
    public override func setupViewHierarchy() {
        
    }
}

import SwiftUI
import PeriodumCore

struct Previews_PERElementCardView_Previews: PreviewProvider {
    static var previews: some View {
        UIVIewPreview(
            make: PERElementCardView(
                model: PERElementCardModel(
                    from: previewHeliumElement
                )
            )
        )
    }
}

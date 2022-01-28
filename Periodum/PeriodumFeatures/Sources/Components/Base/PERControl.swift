//  PERControl.swift
//  Created by Umur Gedik on 28.01.2022.

import UIKit

open class PERControl: UIControl {
    public init() {
        super.init(frame: .zero)
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupViewHierarchy() { }
}

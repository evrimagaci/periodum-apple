//  PERViewController.swift
//  OverwatchFanbaseIOS
//  Created by Umur Gedik on 12.01.2022.

import UIKit
import SwiftUI

open class PERViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIViewController {
    func add(_ childViewController: UIViewController, parentView: UIView? = nil) {
        addChild(childViewController)
        (parentView ?? view).addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public let make: () -> ViewController
    public init(make: @escaping () -> ViewController) {
        self.make = make
    }
    
    public init(make: @autoclosure @escaping () -> ViewController) {
        self.make = make
    }
    
    public func makeUIViewController(context: Context) -> ViewController {
        make()
    }
    
    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

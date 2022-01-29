//
//  PERKeyboardAwareViewController.swift
//  SpendLogIOS
//
//  Created by Umur Gedik on 14.01.2022.
//

import UIKit

class PERKeyboardAwareViewController<Child>: PERViewController where Child: UIViewController {
    public let child: Child
    private let notificationCenter: NotificationCenter
    
    init(child: Child, notificationCenter: NotificationCenter = .default) {
        self.child = child
        self.notificationCenter = notificationCenter
        super.init()
    }
    
    override func loadView() {
        view = UIView()
        add(child)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        child.view.frame = view.bounds
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        guard let animation = KeyboardAnimation(from: notification) else { return }
        
        let extraHeight = view.bounds.maxY - animation.endFrame.minY - view.safeAreaInsets.bottom
        child.additionalSafeAreaInsets.bottom = extraHeight
        let options = UIView.AnimationOptions(rawValue: UInt(animation.curve.rawValue) << 16)
        UIView.animate(withDuration: animation.duration, delay: 0, options: options) {
            self.view.layoutIfNeeded()
        }
    }
}

struct KeyboardAnimation {
    let beginFrame: CGRect
    let endFrame: CGRect
    let duration: TimeInterval
    let curve: UIView.AnimationCurve
    
    init?(from notification: Notification) {
        guard
            let info = notification.userInfo,
            let beginFrame = (info[UIWindow.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let endFrame = (info[UIWindow.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = (info[UIWindow.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curveRaw = (info[UIWindow.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue,
            let curve = UIView.AnimationCurve(rawValue: Int(curveRaw))
        else {
            return nil
        }
        
        self.beginFrame = beginFrame
        self.endFrame = endFrame
        self.duration = duration
        self.curve = curve
    }
}

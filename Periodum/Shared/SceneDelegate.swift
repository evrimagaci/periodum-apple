//
//  SceneDelegate.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import SwiftUI
import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard
            let windowScene = scene as? UIWindowScene,
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }
        
        #if targetEnvironment(macCatalyst)
        windowScene.titlebar?.separatorStyle = .line
        windowScene.titlebar?.titleVisibility = .hidden
        windowScene.titlebar?.toolbarStyle = .unified
        windowScene.titlebar?.toolbar = NSToolbar()
        windowScene.titlebar?.toolbar?.delegate = self
        #endif
        
        let mainView = MainView(application: appDelegate.application)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: mainView)
        window.makeKeyAndVisible()
        self.window = window
    }
}

#if targetEnvironment(macCatalyst)
extension SceneDelegate: NSToolbarDelegate {
}
#endif

//
//  AppDelegate.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import UIKit
import PeriodumCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let application = Application(config: .default)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print(loadPreviewElements()[0])
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

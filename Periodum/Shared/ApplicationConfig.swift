//  ApplicationConfig.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import Foundation

struct ApplicationConfig {
    let apiBaseURL: URL
    
    static let `default` = ApplicationConfig(apiBaseURL: URL(string: "https://periodum.com/api")!)
}

//  Application.swift
//  Periodum (iOS)
//  Created by Umur Gedik on 16.01.2022.

import Foundation
import Combine

import PeriodumCore

@MainActor
class Application {
    let apiClient: PeriodumAPI
    
    lazy var store = Store(api: apiClient)
    lazy var periodicTableViewModel = PeriodicTableViewModel(store: store)
    
    init(config: ApplicationConfig) {
        let urlSessionConfig = URLSessionConfiguration.default
        urlSessionConfig.requestCachePolicy = .returnCacheDataElseLoad
        urlSessionConfig.urlCache = URLCache(memoryCapacity: 512 * 1024 * 1024, diskCapacity: 512 * 1024 * 1024, directory: nil)
        let urlSession = URLSession(configuration: urlSessionConfig)
        
        apiClient = PeriodumAPI(baseURL: config.apiBaseURL, requestHandler: urlSession)
    }
}

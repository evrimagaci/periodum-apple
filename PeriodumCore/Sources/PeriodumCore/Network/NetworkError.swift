//  NetworkError.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public enum NetworkError: Error {
    case unreachable
    case badResponse(URLResponse)
    case unknown
    
    public var isRetriable: Bool {
        switch self {
        case .unreachable:
            return true
            
        case .badResponse:
            return false
            
        case .unknown:
            return false
        }
    }
}

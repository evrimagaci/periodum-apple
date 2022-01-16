//  Endpoint.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public protocol Endpoint {
    associatedtype Response
    func urlRequest(relativeTo baseURL: URL) -> URLRequest
    
    var path: String { get }
    var body: Data? { get }
    var method: HTTPMethod { get }
    var queryParamaters: [URLQueryItem] { get }
}

public extension Endpoint {
    var body: Data? { nil }
    var method: HTTPMethod { .get }
    var queryParamaters: [URLQueryItem] { [] }
    
    func urlRequest(relativeTo baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryParamaters.isEmpty ? nil : queryParamaters
        
        var request = URLRequest(url: urlComponents.url!)
        print("REQUEST URL:", request.url!)
        request.httpMethod = method.rawValue.uppercased()
        request.httpBody = body
        return request
    }
}

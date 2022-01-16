//  RequestHandler.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public protocol RequestHandler {
    func run(request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession: RequestHandler {
    public func run(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        var task: URLSessionDataTask?
        let onCancel = { task?.cancel() }
        
        return try await withTaskCancellationHandler {
            onCancel()
        } operation: {
            try await withCheckedThrowingContinuation { continuation in
                task = self.dataTask(with: request) { data, response, error in
                    if error != nil {
                        continuation.resume(throwing: NetworkError.unreachable)
                        return
                    }
                    
                    guard let response = response, let data = data else {
                        fatalError("This should never happen")
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        continuation.resume(throwing: NetworkError.badResponse(response))
                        return
                    }

                    guard (200..<400).contains(httpResponse.statusCode) else {
                        continuation.resume(throwing: NetworkError.badResponse(response))
                        return
                    }
                    
                    continuation.resume(returning: (data, httpResponse))
                }
                
                task?.resume()
            }
        }

    }
}

#if DEBUG
public extension RequestHandler where Self == MockRequestHandler {
    static var mock: RequestHandler { MockRequestHandler() }
}

public class MockRequestHandler: RequestHandler {
    public func run(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        return (Data(), HTTPURLResponse())
    }
}
#endif

//  PeriodumAPI.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public class PeriodumAPI {
    public let baseURL: URL
    private let requestHandler: RequestHandler
    public init(baseURL: URL, requestHandler: RequestHandler = URLSession.shared) {
        self.baseURL = baseURL
        self.requestHandler = requestHandler
    }
    
    public func fetch<E: Endpoint, Response: Decodable>(_ endpoint: E) async throws -> Response where E.Response == Response {
        let (data, _) = try await requestHandler.run(request: endpoint.urlRequest(relativeTo: baseURL))
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    public func perform<E: Endpoint>(_ endpoint: E) async throws where E.Response == Void {
        let _ = try await requestHandler.run(request: endpoint.urlRequest(relativeTo: baseURL))
    }
}

#if DEBUG
public extension PeriodumAPI {
    static var noopMock: PeriodumAPI {
        PeriodumAPI(
            baseURL: URL(string: "https://periodum.mock.local/api")!,
            requestHandler: .mock
        )
    }
}
#endif

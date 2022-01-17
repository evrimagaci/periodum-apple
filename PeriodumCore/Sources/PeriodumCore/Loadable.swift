//  Loadable.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public enum Loadable<Content> {
    case idle
    case loading
    case successful(Content)
    case failure(Error)
    
    public func map<T>(_ transform: (Content) -> T) -> Loadable<T> {
        switch self {
        case .idle: return .idle
        case .loading: return .loading
        case .successful(let value): return .successful(transform(value))
        case .failure(let error): return .failure(error)
        }
    }
    
    public func mapElements<T, U>(_ transform: (T) -> U) -> Loadable<[U]> where Content: Sequence, Content.Element == T {
        switch self {
        case .idle: return .idle
        case .loading: return .loading
        case .successful(let value): return .successful(value.map(transform))
        case .failure(let error): return .failure(error)
        }
    }
}

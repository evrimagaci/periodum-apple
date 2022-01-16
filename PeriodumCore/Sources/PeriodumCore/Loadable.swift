//  Loadable.swift
//  Created by Umur Gedik on 16.01.2022.

import Foundation

public enum Loadable<Content> {
    case idle
    case loading
    case successful(Content)
    case failure(Error)
}

//
//  PreviewContent.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

#if DEBUG
import Foundation

public let previewElements: [Element] = try! JSONDecoder().decode(
    [Element].self,
    from: try! Data(
        contentsOf: Bundle.module.url(
            forResource: "elements",
            withExtension: "json",
            subdirectory: "PreviewContent"
        )!
    )
)

public func loadPreviewElements() -> [Element] {
    let jsonURL = Bundle.module.url(
        forResource: "elements",
        withExtension: "json"
    )
    
    guard let jsonURL = jsonURL else {
        fatalError("Preview JSON is nil")
    }
    
    return try! JSONDecoder().decode(
        [Element].self,
        from: try! Data(contentsOf: jsonURL)
    )
}

#endif

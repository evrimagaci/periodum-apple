//
//  PreviewContent.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

#if DEBUG

import Foundation
import PeriodumCore

let previewElements: [Element] = try! JSONDecoder().decode(
    [Element].self,
    from: try! Data(
        contentsOf: Bundle.main.url(
            forResource: "elements",
            withExtension: "json"
        )!
    )
)

#endif

// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PeriodumCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "PeriodumCore",
            targets: ["PeriodumCore"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PeriodumCore",
            dependencies: [],
            resources: [
                .copy("PreviewContent/elements.json")
            ]),
        .testTarget(
            name: "PeriodumCoreTests",
            dependencies: ["PeriodumCore"]),
    ]
)

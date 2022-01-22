// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PeriodumFeatures",
    platforms: [.iOS(.v14), .macCatalyst(.v14)],
    products: [
        .library(
            name: "ElementInspector",
            targets: ["ElementInspector"]),
        
        .library(
            name: "ElementCard",
            targets: ["ElementCard"]),
        
        .library(name: "PeriodicTable", targets: ["PeriodicTable"]),
    ],
    dependencies: [
        .package(name: "PeriodumCore", path: "../PeriodumCore"),
        .package(name: "PlatformHelpers", path: "../PlatformHelpers"),
    ],
    targets: [
        .target(
            name: "ElementInspector",
            dependencies: ["Components", "PeriodumCore", "ElementCard"]),
        
        .target(
            name: "ElementCard",
            dependencies: ["Components", "PeriodumCore", "PlatformHelpers"]),
        
        .target(
            name: "PeriodicTable",
            dependencies: ["Components", "PeriodumCore", "PlatformHelpers", "ElementCard"]),
        
        .target(
            name: "Components",
            dependencies: ["PeriodumCore"]),
    ]
)

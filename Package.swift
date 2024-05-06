// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "AlertKit",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AlertKit",
            targets: ["AlertKit"]),
    ],
    targets: [
        .target(
            name: "AlertKit"),
        .testTarget(
            name: "AlertKitTests",
            dependencies: ["AlertKit"]),
    ]
)

// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "AlertUI",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AlertUI",
            targets: ["AlertUI"]),
    ],
    targets: [
        .target(
            name: "AlertUI"),
        .testTarget(
            name: "AlertUITests",
            dependencies: ["AlertUI"]),
    ]
)

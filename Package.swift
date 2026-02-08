// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShimmerKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "ShimmerKit",
            targets: ["ShimmerKit"]),
    ],
    targets: [
        .target(
            name: "ShimmerKit",
            dependencies: []),
        .testTarget(
            name: "ShimmerKitTests",
            dependencies: ["ShimmerKit"]),
    ]
)

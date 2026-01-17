// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libp2p-app-template",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/swift-libp2p/swift-libp2p", .upToNextMinor(from: "0.3.3")),
        // Noise Security Module
        .package(url: "https://github.com/swift-libp2p/swift-libp2p-noise", .upToNextMinor(from: "0.2.0")),
        // YAMUX Muxer Module
        .package(url: "https://github.com/swift-libp2p/swift-libp2p-yamux", .upToNextMinor(from: "0.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "LibP2P", package: "swift-libp2p"),
                .product(name: "LibP2PNoise", package: "swift-libp2p-noise"),
                .product(name: "LibP2PYAMUX", package: "swift-libp2p-yamux"),
            ],
            swiftSettings: swiftSettings),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App")
            ],
            swiftSettings: swiftSettings),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
] }

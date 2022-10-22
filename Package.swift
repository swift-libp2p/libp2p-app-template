// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libp2p-app-template",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/swift-libp2p/swift-libp2p", .upToNextMinor(from: "0.1.0")),
        // Noise Security Module
        .package(url: "https://github.com/swift-libp2p/swift-libp2p-noise", .upToNextMinor(from: "0.1.0")),
        // MPLEX Muxer Module
        .package(url: "https://github.com/swift-libp2p/swift-libp2p-mplex", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "App",
            dependencies: [
                .product(name: "LibP2P", package: "swift-libp2p"),
                .product(name: "LibP2PNoise", package: "swift-libp2p-noise"),
                .product(name: "LibP2PMPLEX", package: "swift-libp2p-mplex"),
            ]),
        .executableTarget(
            name: "Run",
            dependencies: [.target(name: "App")]),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App")
            ]),
    ]
)

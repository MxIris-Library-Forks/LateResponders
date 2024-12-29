// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LateResponders",
    platforms: [.macOS(.v10_13), .iOS(.v12), .tvOS(.v12), .macCatalyst(.v13), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LateResponders",
            targets: ["LateResponders"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LateResponders",
            path: "LateResponders"
        ),
        .testTarget(
            name: "LateRespondersTests",
            dependencies: ["LateResponders"],
            path: "LateRespondersTests"
        ),
    ]
)

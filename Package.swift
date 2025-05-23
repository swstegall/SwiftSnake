// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSnake",
    dependencies: [
        .package(url: "https://github.com/STREGAsGate/Raylib.git", branch: "master"),
        .package(url: "https://github.com/swstegall/SwiftDataStructures.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SwiftSnake",
            dependencies: [
                "Raylib",
                "SwiftDataStructures"
            ]
        ),
    ]
)


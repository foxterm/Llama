// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Llama",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "llama", targets: ["llama"]),
    ],
    targets: [
        .binaryTarget(
            name: "llama",
            path: "llama.xcframework"
        ),
    ]
)

// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Llama",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "Llama", targets: ["Llama"]),
    ],
    targets: [
        .binaryTarget(
            name: "Llama",
            path: "llama.xcframework"
        ),
    ]
)

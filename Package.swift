// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LinearProgressBar",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "LinearProgressBar", targets: ["LinearProgressBar"])
    ],
    targets: [
        .target(name: "LinearProgressBar", path: "Sources")
    ]
)


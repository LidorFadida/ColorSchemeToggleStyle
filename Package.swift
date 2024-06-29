// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorSchemeToggleStyle",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ColorSchemeToggleStyle",
            targets: ["ColorSchemeToggleStyle"]),
    ],
    targets: [
        .target(
            name: "ColorSchemeToggleStyle")
    ]
)

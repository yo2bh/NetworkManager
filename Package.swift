// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkManager",
    products: [
        .library(
            name: "NetworkManager",
            type: .dynamic,
            targets: ["NetworkManager"]),
    ],
    dependencies: [
         .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "NetworkManager",
            dependencies: []),
    ]
)

// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "App",
            targets: ["App"]),
        .library(
            name: "PokeApiService",
            targets: ["PokeApiService"]),
        .library(
            name: "PokeList",
            targets: ["PokeList"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PokeApiService",
            dependencies: ["Alamofire"]),
        .target(
            name: "PokeList",
            dependencies: ["SFSafeSymbols", "PokeApiService"]),
        .target(
            name: "App",
            dependencies: []),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
    ]
)

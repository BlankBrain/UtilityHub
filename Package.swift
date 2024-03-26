// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.




import PackageDescription

let package = Package(
    name: "UtilityHub",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UtilityHub",
            targets: ["UtilityHub"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/TheRakiburKhan/RKAPIService.git", from: Version(3, 0, 0)),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: Version(4,0,0)),
        .package(url: "https://github.com/SVGKit/SVGKit.git", from: Version(3, 0, 0)),
        .package(url: "https://github.com/EFPrefix/EFQRCode.git", .upToNextMinor(from: "6.2.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UtilityHub",
            dependencies: [.product(name: "Lottie", package: "lottie-ios"), "SVGKit", "RKAPIService" , "EFQRCode"]),
        .testTarget(
            name: "UtilityHubTests",
            dependencies: ["UtilityHub"]),
    ]
)

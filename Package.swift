// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OILiveness2D",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "OILiveness2D", targets: ["OILiveness2DWrapper"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/oititec/ios-common-modules.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "OILiveness2DWrapper",
            dependencies: [
                .target(name: "OILiveness2D"),
                .product(name: "OICommons", package: "ios-common-modules"),
                .product(name: "OIComponents", package: "ios-common-modules"),
                .product(name: "OINetwork", package: "ios-common-modules"),
                .product(name: "OISecurity", package: "ios-common-modules")
            ],
            path: "OILiveness2DWrapper"
        ),
        .binaryTarget(
            name: "OILiveness2D",
            path: "Framework/OILiveness2D.xcframework"
        )
    ]
)
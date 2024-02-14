// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Counter",
  platforms: [
    .iOS(.v15),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "Counter",
      targets: ["Counter"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.7.3")
  ],
  targets: [
    .target(
      name: "Counter",
      dependencies: [
      .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "CounterTests",
      dependencies: [
        "Counter",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
  ]
)

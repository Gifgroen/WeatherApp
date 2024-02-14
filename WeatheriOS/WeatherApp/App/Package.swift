// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "App",
  platforms: [
    .iOS(.v15),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "App",
      targets: ["App"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.7.3"),
    .package(path: "../Features/Contacts"),
    .package(path: "../Features/Counter"),
    .package(path: "../Features/WeatherForecast")
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        "Contacts",
        "Counter",
        "WeatherForecast"
      ]
    ),
    .testTarget(
      name: "AppTests",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        "App"
      ]
    )
  ]
)

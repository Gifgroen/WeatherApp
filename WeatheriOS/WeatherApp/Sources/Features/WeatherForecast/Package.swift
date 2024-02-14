// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "WeatherForecast",
  platforms: [
    .iOS(.v15),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "WeatherForecast",
      targets: ["WeatherForecast"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.7.3")
  ],
  targets: [
    .target(
      name: "WeatherForecast",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "WeatherForecastTests",
      dependencies: [
        "WeatherForecast",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    )
  ]
)

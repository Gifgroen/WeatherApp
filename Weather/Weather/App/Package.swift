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
  targets: [
    .target(
      name: "App"
    ),
    .testTarget(
      name: "AppTests",
      dependencies: ["App"]
    ),
  ]
)

// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Contacts",
  platforms: [
    .iOS(.v15),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "Contacts",
      targets: ["Contacts"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.7.3")
  ],
  targets: [
    .target(
      name: "Contacts",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "ContactsTests",
      dependencies: ["Contacts"]
    )
  ]
)

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SemanticVersion",
  products: [
    .library(
      name: "SemanticVersion",
      targets: ["SemanticVersion"])
  ],
  targets: [
    .target(
      name: "SemanticVersion"),
    .testTarget(
      name: "SemanticVersionTests",
      dependencies: ["SemanticVersion"]
    ),
  ]
)

// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "SagaParsleyMarkdownReader",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "SagaParsleyMarkdownReader",
      targets: ["SagaParsleyMarkdownReader"]),
  ],
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "0.18.0"),
    .package(name: "Parsley", url: "https://github.com/loopwerk/Parsley", from: "0.3.0"),
  ],
  targets: [
    .target(
      name: "SagaParsleyMarkdownReader",
      dependencies: [
        "Saga",
        "Parsley",
      ]),
    .testTarget(
      name: "SagaParsleyMarkdownReaderTests",
      dependencies: ["SagaParsleyMarkdownReader"]),
  ]
)

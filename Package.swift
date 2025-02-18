// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "SagaParsleyMarkdownReader",
  platforms: [
    .macOS(.v12)
  ],
  products: [
    .library(
      name: "SagaParsleyMarkdownReader",
      targets: ["SagaParsleyMarkdownReader"]),
  ],
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "2.0.0"),
    .package(name: "Parsley", url: "https://github.com/loopwerk/Parsley", from: "0.6.0"),
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

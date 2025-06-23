// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "SagaParsleyMarkdownReader",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "SagaParsleyMarkdownReader",
      targets: ["SagaParsleyMarkdownReader"]
    ),
  ],
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "2.0.3"),
    .package(name: "Parsley", url: "https://github.com/loopwerk/Parsley", from: "0.9.0"),
    .package(name: "PathKit", url: "https://github.com/kylef/PathKit", from: "1.0.1"),
  ],
  targets: [
    .target(
      name: "SagaParsleyMarkdownReader",
      dependencies: [
        "Saga",
        "Parsley",
      ]
    ),
    .testTarget(
      name: "SagaParsleyMarkdownReaderTests",
      dependencies: [
        "SagaParsleyMarkdownReader",
        "PathKit",
      ],
      resources: [
        .copy("test-content.md"),
        .copy("frontmatter-only.md"),
        .copy("content-only.md"),
        .copy("special-chars.md"),
        .copy("hard-breaks.md"),
        .copy("smart-quotes.md"),
      ]
    ),
  ]
)

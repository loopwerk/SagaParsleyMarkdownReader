// swift-tools-version:5.10

import PackageDescription

let package = Package(
  name: "SagaParsleyMarkdownReader",
  platforms: [
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "SagaParsleyMarkdownReader",
      targets: ["SagaParsleyMarkdownReader"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/loopwerk/Saga.git", from: "2.0.3"),
    .package(url: "https://github.com/loopwerk/Parsley", from: "1.0.0"),
    .package(url: "https://github.com/kylef/PathKit", from: "1.0.1"),
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

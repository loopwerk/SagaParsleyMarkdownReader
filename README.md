# SagaParsleyMarkdownReader

A Markdown reader for [Saga](https://github.com/loopwerk/Saga), which uses [Parsley](https://github.com/loopwerk/Parsley).

## Usage
Include `SagaParsleyMarkdownReader` in your Package.swift as usual:

``` swift
let package = Package(
  name: "MyWebsite",
  dependencies: [
    .package(url: "https://github.com/loopwerk/Saga", from: "1.0.0"),
    .package(url: "https://github.com/loopwerk/SagaParsleyMarkdownReader", from: "0.6.0"),
  ],
  targets: [
    .target(
      name: "MyWebsite",
      dependencies: ["Saga", "SagaParsleyMarkdownReader"]),
  ]
)
```

And then in your website you can `import SagaParsleyMarkdownReader` and use `parsleyMarkdownReader`.

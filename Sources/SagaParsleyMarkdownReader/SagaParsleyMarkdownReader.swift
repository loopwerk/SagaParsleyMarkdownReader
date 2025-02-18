import Foundation
import Saga
import Parsley

public extension Reader {
  static var parsleyMarkdownReader: Self {
    .parsleyMarkdownReader()
  }

  static func parsleyMarkdownReader(
    markdownOptions: MarkdownOptions = [.unsafe, .hardBreaks, .smartQuotes],
    syntaxExtensions: [SyntaxExtension] = SyntaxExtension.defaultExtensions) -> Self {
    Reader(supportedExtensions: ["md", "markdown"], convert: { absoluteSource in
      let rawContent: String = try absoluteSource.read()
      let document = try Parsley.parse(
        rawContent,
        options: markdownOptions,
        syntaxExtensions: syntaxExtensions
      )
      return (document.title, document.body, document.metadata)
    })
  }
}

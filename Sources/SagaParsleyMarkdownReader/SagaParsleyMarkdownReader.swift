import Foundation
import Parsley
import Saga

public extension Reader {
  static var parsleyMarkdownReader: Self {
    .parsleyMarkdownReader()
  }
  
  static var parsleyMarkdownWithAttributesReader: Self {
    .parsleyMarkdownReader(markdownOptions: [.unsafe, .hardBreaks, .smartQuotes, .markdownAttributes])
  }

  static func parsleyMarkdownReader(
    markdownOptions: MarkdownOptions = [.unsafe, .hardBreaks, .smartQuotes],
    syntaxExtensions: [SyntaxExtension] = SyntaxExtension.defaultExtensions
  ) -> Self {
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

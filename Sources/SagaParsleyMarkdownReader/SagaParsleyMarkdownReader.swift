import Foundation
import Saga
import Parsley

public extension Reader {
  static func parsleyMarkdownReader(
    markdownOptions: MarkdownOptions = [.unsafe, .hardBreaks, .smartQuotes],
    syntaxExtensions: [SyntaxExtension] = SyntaxExtension.defaultExtensions) -> Self {
    Reader(supportedExtensions: ["md", "markdown"], convert: { absoluteSource, relativeSource, relativeDestination in
      let contents: String = try absoluteSource.read()

      // First we parse the markdown file
      let document = try Parsley.parse(
        contents,
        options: markdownOptions,
        syntaxExtensions: syntaxExtensions
      )

      // Then we try to decode the embedded metadata within the markdown (which otherwise is just a [String: String] dict)
      let decoder = makeMetadataDecoder(for: document.metadata)
      let published = try resolvePublishingDate(from: absoluteSource, decoder: decoder)
      let metadata = try M(from: decoder)

      // Create the Item
      let item = Item(
        relativeSource: relativeSource,
        relativeDestination: relativeDestination,
        title: document.title ?? absoluteSource.lastComponentWithoutExtension,
        rawContent: contents,
        body: document.body,
        published: published,
        created: absoluteSource.creationDate ?? Date(),
        lastModified: absoluteSource.modificationDate ?? Date(),
        metadata: metadata
      )

      return item
    })
  }
}

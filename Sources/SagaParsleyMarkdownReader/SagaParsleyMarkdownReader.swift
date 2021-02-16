import Foundation
import Saga
import Parsley

public extension Reader {
  static func parsleyMarkdownReader(itemProcessor: ((Item<M>) -> Void)? = nil) -> Self {
    Reader(supportedExtensions: ["md", "markdown"], convert: { absoluteSource, relativeSource, relativeDestination in
      let contents: String = try absoluteSource.read()

      // First we parse the markdown file
      let markdown = try Parsley.parse(contents, options: [.unsafe, .hardBreaks, .smartQuotes])

      // Then we try to decode the embedded metadata within the markdown (which otherwise is just a [String: String] dict)
      let decoder = makeMetadataDecoder(for: markdown.metadata)
      let date = try resolvePublishingDate(from: absoluteSource, decoder: decoder)
      let metadata = try M(from: decoder)

      // Create the Item
      let item = Item(
        relativeSource: relativeSource,
        relativeDestination: relativeDestination,
        title: markdown.title ?? absoluteSource.lastComponentWithoutExtension,
        rawContent: contents,
        body: markdown.body,
        date: date,
        lastModified: absoluteSource.modificationDate ?? Date(),
        metadata: metadata
      )

      // Run the processor, if any, to modify the Item
      if let itemProcessor = itemProcessor {
        itemProcessor(item)
      }

      return item
    })
  }
}

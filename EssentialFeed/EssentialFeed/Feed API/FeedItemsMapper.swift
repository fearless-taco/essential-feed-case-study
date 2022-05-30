internal class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }

    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.isOk,
                let root = try? JSONDecoder().decode(Root.self, from: data) else {
                     throw RemoteFeedLoader.Error.invalidData
        }

        return root.items
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let article = try? JSONDecoder().decode(Article.self, from: jsonData)

import Foundation

// MARK: - Article
struct ArticleResponse: Codable {
    let status: String // can be either 'ok' or 'error'
    let totalResults: Int
    let articles: [ArticleElement]
}

// MARK: - ArticleElement
struct ArticleElement: Codable, Identifiable {
    var id = UUID()

    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?

    // Exclude `id` from decoding (it's auto-generated for Identifiable)
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}


import Foundation

protocol ArticleService {
    func fetchHeadlines() async throws -> ArticleResponse
}

class RealArticleService: ArticleService {
    private let apiKey = Secrets.newsAPIKey

    func fetchHeadlines() async throws -> ArticleResponse {
        let requestUrlString =
            "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)&pageSize=5"

        guard let url = URL(string: requestUrlString) else {
            throw ArticleError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ArticleError.unknown
        }

        guard httpResponse.statusCode == 200 else {
            throw ArticleError.requestFailed(statusCode: httpResponse.statusCode)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(ArticleResponse.self, from: data)
    }
}

class MockArticleService: ArticleService {
    func fetchHeadlines() async throws -> ArticleResponse {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)

        let mockJSON = """
        {
          "status": "ok",
          "totalResults": 28,
          "articles": [
            {
              "source": { "id": null, "name": "CNBC" },
              "author": "Sean Conlon, Fred Imbert",
              "title": "Dow surges 500 points as traders look past rout in precious metals and bitcoin: Live updates - CNBC",
              "description": "More than 100 S&P 500 companies are due to report this week, including Amazon, Alphabet and Disney.",
              "url": "https://www.cnbc.com/2026/02/01/stock-market-today-live-updates.html",
              "urlToImage": "https://image.cnbcfm.com/api/v1/image/108232526-1764791894488-108232526-1764171508892-gettyimages-2248555747-anotherday153732181_e40jwrlr.jpg?v=1770051127&w=1920&h=1080",
              "publishedAt": "2026-02-02T21:14:00Z",
              "content": "U.S. equities rose on Monday as Wall Street began a new month of trading, with investors looking past the recent losses in silver and bitcoin."
            },
            {
              "source": { "id": "associated-press", "name": "Associated Press" },
              "author": "Mike Catalini, Steve Karnowski, Sharon Lurye",
              "title": "Father of 5-year-old detained in Minnesota disputes government assertion he abandoned the boy - AP News",
              "description": "The father of a 5-year-old boy detained by immigration officers in Texas denies abandoning his son.",
              "url": "https://apnews.com/article/immigration-minnesota-trump-ice-liam-5cd3379ce44db7a38ad0b2c5e910da54",
              "urlToImage": "https://dims.apnews.com/dims4/default/f4bb2e3/2147483647/strip/true/crop/1200x800+0+0/resize/980x653!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F27%2Fc2%2F534149dc4e843b6fffa8b51dc69a%2Ffc295c0e1e2a4db5b2ff5c1d5110baa0",
              "publishedAt": "2026-02-02T21:11:00Z",
              "content": "MINNEAPOLIS (AP) The father of a 5-year-old boy who was detained by immigration officers and held at a federal facility in Texas denied government accounts Monday that he abandoned his son last month."
            },
            {
              "source": { "id": "abc-news", "name": "ABC News" },
              "author": "ABC News",
              "title": "Brendan Banfield double murder trial: Man found guilty in elaborate plot to get rid of his wife - ABC News",
              "description": null,
              "url": "https://abcnews.go.com/US/brendan-banfield-double-murder-trial-verdict-reached-man/story?id=129707348",
              "urlToImage": null,
              "publishedAt": "2026-02-02T20:58:20Z",
              "content": null
            },
            {
              "source": { "id": null, "name": "NPR" },
              "author": "",
              "title": "The Trump Administration exempts new nuclear reactors from environmental review - NPR",
              "description": "The announcement comes just days after NPR revealed the administration had secretly rewritten safety and environmental standards.",
              "url": "https://www.npr.org/2026/02/02/nx-s1-5696525/trump-nuclear-safety-regulations-environmental-review",
              "urlToImage": "https://npr.brightspotcdn.com/dims3/default/strip/false/crop/2500x1406+0+260/resize/1400/quality/85/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F26%2Ffc%2F8442905e43fab7412bc2170d4b94%2F32176873800-c43d69da1d-o-1.jpg",
              "publishedAt": "2026-02-02T20:09:46Z",
              "content": "The Trump Administration has created an exclusion for new experimental reactors being built at sites around the U.S. from a major environmental law."
            },
            {
              "source": { "id": null, "name": "CNBC" },
              "author": "Melissa Repko",
              "title": "Here are the retailers with the most store openings and closures planned for 2026 - CNBC",
              "description": "Stores closures in the U.S. are expected to fall to the lowest level in the past three years, according to an analysis by Coresight Research.",
              "url": "https://www.cnbc.com/2026/02/02/store-openings-and-closures-2026-dollar-general-aldi-gamestop.html",
              "urlToImage": "https://image.cnbcfm.com/api/v1/image/108259694-1769795630641-Untitled-1.jpg?v=1769795686&w=1920&h=1080",
              "publishedAt": "2026-02-02T19:25:18Z",
              "content": "Dollar General and Aldi logos. Store openings in the U.S. are expected to rise and store closures fall this year compared to 2025."
            }
          ]
        }
        """

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(ArticleResponse.self, from: Data(mockJSON.utf8))
    }
}

//
//  ArticleVewModel.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 01/02/26.
//

import Foundation

@Observable
class ArticleViewModel {
    var data: ArticleResponse?
    var isLoading = false
    var errorMessage: String?

    private let service: ArticleService

    init(service: ArticleService = RealArticleService()) {
        self.service = service
    }

    private func fetchHeadline() async throws -> ArticleResponse {
        isLoading = true
        errorMessage = nil
        let result = try await service.fetchHeadlines()
        isLoading = false
        return result
    }

    // runs on main thread (same as User interface)
    @MainActor
    func fetch() async {
        do {
            data = try await fetchHeadline()
        } catch {
            isLoading = false
            if let articleError = error as? ArticleError {
                errorMessage = articleError.localizedDescription
            } else {
                errorMessage = "Unexpected error: \(error.localizedDescription)"
            }
        }
    }
}

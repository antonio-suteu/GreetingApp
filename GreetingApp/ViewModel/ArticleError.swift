import Foundation

enum ArticleError: LocalizedError {
    case invalidURL
    case requestFailed (statusCode: Int)
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "The provided URL is invalid"
        case .requestFailed(let statusCode):
            "Request failed with status code: \(statusCode)"
        case .decodingFailed:
            "Unable to decode data. the server may have changed it's response format"
        case .unknown:
            "An unknown error occurred"
        }
    }
}

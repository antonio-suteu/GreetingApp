import SwiftUI

enum Language: String, CaseIterable {
    case english = "en"
    case spanish = "es"
    case italian = "it"
    case arabic = "ar"
    case chinese = "zh-Hans"

    var flag: String {
        switch self {
        case .english: return "🇺🇸"
        case .spanish: return "🇪🇸"
        case .italian: return "🇮🇹"
        case .arabic: return "🇸🇦"
        case .chinese: return "🇨🇳"
        }
    }

    var displayName: String {
        switch self {
        case .english: return "English"
        case .spanish: return "Español"
        case .italian: return "Italiano"
        case .arabic: return "العربية"
        case .chinese: return "中文"
        }
    }

    var layoutDirection: LayoutDirection {
        switch self {
        case .arabic: return .rightToLeft
        default: return .leftToRight
        }
    }
}

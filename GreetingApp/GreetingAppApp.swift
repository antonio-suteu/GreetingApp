import SwiftUI

@main
struct GreetingAppApp: App {
    @State private var language: String = Language.english.rawValue

    var layoutDirection: LayoutDirection {
        Language(rawValue: language)?.layoutDirection ?? .leftToRight
    }

    var body: some Scene {
        WindowGroup {
            MainView(language: $language)
                .environment(\.locale, Locale(identifier: language))
                .environment(\.layoutDirection, layoutDirection)
        }
    }
}

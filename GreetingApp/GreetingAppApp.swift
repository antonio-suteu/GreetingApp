import SwiftUI

@main
struct GreetingAppApp: App {
    @AppStorage("language") var language: String = Language.english.rawValue
    
    // computed property, it returns the layoutDirection from the selected language
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

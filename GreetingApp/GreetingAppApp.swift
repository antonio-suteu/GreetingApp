import SwiftUI
import TipKit

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
                .task {
                    // Configure and load your tips at app launch.
                    do {
                        
                        // Only for testing purposes!
                        // try Tips.resetDatastore()
                        
                        try Tips.configure()
                    } catch {
                        // Handle TipKit errors
                        print("Error initializing TipKit \(error.localizedDescription)")
                    }
                }
        }
    }
}

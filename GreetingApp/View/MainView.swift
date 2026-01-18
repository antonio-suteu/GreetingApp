import SwiftUI
// PORTRAIT
// iPhone - compact width, regular height
// iPad - regular width, regular height

// LANDSCAPE
// iPhone - compact width, compact height
// iPad - regular width, regular height
/// This View Simply chooses between displaying the content view in regular or landscape mode
struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact &&
            verticalSizeClass == .regular
    }

    var isTablet: Bool {
        horizontalSizeClass == .regular &&
            verticalSizeClass == .regular
    }

    @Binding var language: String

    var body: some View {
        let orientation = DeviceOrientation(
            isPortraitPhone: isPortraitPhone,
            isTablet: isTablet
        )

        if isPortraitPhone || isTablet {
            NavigationStack {
                ContentView()
                    .environment(\.deviceOrientation, orientation)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguagePickerView(language: $language)
                        }
                    }
            }

        } else {
            // Landscape mode (iPhone) ?
            NavigationStack {
                LandscapeContentView()
                    .environment(\.deviceOrientation, orientation)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguagePickerView(language: $language)
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView(language: .constant(Language.english.rawValue))
}

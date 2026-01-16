import SwiftUI
// PORTRAIT
// iPhone - compact width, regular height

// LANDSCAPE
// iPhone - compact width, compact height
/// This View Simply chooses between displaying the content view in regular or landscape mode
struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        // Portrait mode (iPhone) ?
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            ContentView()
        } else {
            // Landscape mode ?
            LandscapeContentView()
        }
    }
}

#Preview {
    MainView()
}

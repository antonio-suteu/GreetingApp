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

    var body: some View {
        let orientation = DeviceOrientation(
            isPortraitPhone: isPortraitPhone,
            isTablet: isTablet
        )

        if isPortraitPhone || isTablet {
            ContentView()
                .environment(\.deviceOrientation, orientation)
        } else {
            // Landscape mode (iPhone) ?
            LandscapeContentView()
                .environment(\.deviceOrientation, orientation)
        }
    }
}

#Preview {
    MainView()
//    .environment(\.deviceOrientation, DeviceOrientation(
//        isPortraitPhone: false,
//        isTablet: true
//    ))
}

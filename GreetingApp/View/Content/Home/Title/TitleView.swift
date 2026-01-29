import SwiftUI

struct TitleView: View {
    // MARK: - State Properties
    /// Tracks whether the face icon is in its original orientation or rotated 180 degrees.
    @State private var isRotated: Bool = true
    /// The currently displayed subtitle text.
    @State private var subtitle: LocalizedStringKey = "— Exploring iOS Programming —"
    
    var body: some View {
        // Face icon that rotates when tapped
        TitleIconView(isRotated: $isRotated)

        // Subtitle text that randomizes when tapped
        TitleTextView(subtitle: $subtitle)
    }
}

// MARK: - Previews
#Preview {
    TitleView()
}

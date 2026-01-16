import SwiftUI

/// A view that displays an interactive title section with a rotating icon and a randomizable subtitle.
///
/// `TitleView` presents a dashed face SF Symbol that rotates 180 degrees when tapped,
/// along with a subtitle that cycles through different humorous messages when tapped.
///
/// ## Features
/// - Animated rotation of the face icon
/// - Random subtitle selection from a predefined list
/// - Tap gestures for interaction
///
/// ## Example
/// ```swift
/// var body: some View {
///     VStack {
///         TitleView()
///     }
/// }
/// ```
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

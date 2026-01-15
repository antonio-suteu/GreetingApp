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
    
    /// A collection of possible subtitles that can be randomly selected.
    let subtitles: [LocalizedStringKey] = [
        "— Making napalm at home —",
        "— Exploring the wilderness —",
        "— Wearing socks with sandals —",
        "— Feeling existential dread —",
    ]

    // MARK: - Computed Properties
    
    /// Returns the rotation angle based on the current rotation state.
    ///
    /// - Returns: `.zero` when not rotated, or 180 degrees when rotated.
    var angle: Angle {
        isRotated ? .zero : Angle.degrees(180)
    }

    // MARK: - Body
    
    var body: some View {
        // Face icon that rotates when tapped
        Image(systemName: "face.dashed")
            .font(.system(size: 60))
            .rotationEffect(angle)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }

        // Subtitle text that randomizes when tapped
        Text(subtitle)
            .fontWeight(.semibold)
            .fontDesign(.monospaced)
            .onTapGesture {
                // Select a random subtitle that's different from the current one
                var randomPick: LocalizedStringKey = subtitles.randomElement() ?? subtitle
                while randomPick == subtitle {
                    randomPick = subtitles.randomElement() ?? subtitle
                }

                subtitle = randomPick
            }
            .padding()
    }
}

// MARK: - Previews

#Preview {
    TitleView()
}

import SwiftUI
import TipKit

struct TitleTextView: View {
    // This binding allows to change the state of the parent view that uses this
    @Binding var subtitle: LocalizedStringKey

    @State private var rotationDegrees: Double = 0

    /// A collection of possible subtitles that can be randomly selected.
    let subtitles: [LocalizedStringKey] = [
        "— Exploring iOS Programming —",
        "— Making napalm at home —",
        "— Exploring the wilderness —",
        "— Wearing socks with sandals —",
        "— Feeling existential dread —",
    ]

    // Device orientation information for conditional layout and styling.
    @Environment(\.deviceOrientation) var deviceOrientation

    var font: Font {
        deviceOrientation.isTablet ? .title2 : .body
    }
    
    private let greetingsTip = GreetingsTip()
    
    var body: some View {
        // Subtitle text that randomizes when tapped
        Text(subtitle)
            .fontWeight(.semibold)
            .font(font)
            .fontDesign(.monospaced)
            .onTapGesture {
                // Animate the rotation
                withAnimation(.easeInOut(duration: 0.5)) {
                    rotationDegrees += 360
                }

                // Select a random subtitle that's different from the current one
                var randomPick: LocalizedStringKey = subtitles.randomElement() ?? subtitle
                while randomPick == subtitle {
                    randomPick = subtitles.randomElement() ?? subtitle
                }

                subtitle = randomPick
            }
            .rotation3DEffect(.degrees(rotationDegrees), axis: (x: 0, y: 1, z: 0))
            .popoverTip(greetingsTip)
            .padding()
    }
}

#Preview {
    @Previewable @State var exampleSubtitle: LocalizedStringKey = "— Exploring iOS Programming —"
    TitleTextView(subtitle: $exampleSubtitle)
}

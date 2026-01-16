import SwiftUI

struct TitleTextView: View {
    // This binding allows to change the state of the parent view that uses this
    @Binding var subtitle: LocalizedStringKey

    /// A collection of possible subtitles that can be randomly selected.
    let subtitles: [LocalizedStringKey] = [
        "— Exploring iOS Programming —",
        "— Making napalm at home —",
        "— Exploring the wilderness —",
        "— Wearing socks with sandals —",
        "— Feeling existential dread —",
    ]

    var body: some View {
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

#Preview {
    @Previewable @State var exampleSubtitle: LocalizedStringKey = "— Exploring iOS Programming —"
    TitleTextView(subtitle: $exampleSubtitle)
}

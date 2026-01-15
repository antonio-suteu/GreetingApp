import SwiftUI

/// A view that displays text with a colored background shadow effect.
/// The view applies a red background with adjustable opacity and a matching shadow.
struct TextView: View {
    /// The text content to display.
    let displayText: LocalizedStringKey
    
    /// The opacity of the background color, ranging from 0.0 (transparent) to 1.0 (opaque).
    /// This value changes to 0 when the view is tapped, creating a fade-out effect.
    @State var colorOpacity: Double

    var body: some View {
        Text(displayText)
            .font(.largeTitle)
            .fontWeight(.thin)
            .padding()
            .background(.myRed.opacity(colorOpacity))
            .cornerRadius(5)
            .shadow(
                color: .myRed,
                radius: 5,
                x: 10,
                y: 10
            )
            .onTapGesture {
                colorOpacity = 0
            }
    }
}

#Preview {
    TextView(displayText: "Hello There", colorOpacity: 0.4)
}

import SwiftUI

struct LandscapeGreetingsView: View {
    let messages: [DataItemModel] = [
        .init(
            text: "Greetings",
            colorOpacity: 0.3
        ),
        .init(
            text: "Today's a great day!",
            colorOpacity: 0.4
        ),
        .init(
            text: "End my suffering.",
            colorOpacity: 0.5
        ),
    ]

    var body: some View {
        ZStack {
            BackgroundView()

            HStack(spacing: 25) {
                VStack {
                    TitleView()
                }

                VStack(alignment: .leading, spacing: 25) {
                    MessagesView()
                }
            }
        }
    }
}

#Preview {
    LandscapeGreetingsView()
}

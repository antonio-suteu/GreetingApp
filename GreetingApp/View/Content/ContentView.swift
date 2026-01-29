import SwiftUI

struct ContentView: View {
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
            text: "End my suffering",
            colorOpacity: 0.5
        ),
    ]

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.circle.fill") {
                HomeView()
            }
            // .badge(2)
        }
    }
}

#Preview {
    ContentView()
}

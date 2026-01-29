import SwiftUI

/// A view that displays a collection of greeting messages.
///
/// This view creates a vertical list of `TextView` instances, each displaying
/// a different message with varying background opacity levels.
struct MessagesView: View {
  
    // sample data
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
        )
    ]
    
    var body: some View {
        ForEach(messages){ (item) in
            TextView(displayText: item.text, colorOpacity: item.colorOpacity)
        }
    }
}

#Preview {
    MessagesView()
}

//
//  MessageView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 11/01/26.
//

import SwiftUI

struct MessagesView: View {
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

//
//  ContentView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 11/01/26.
//

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
            text: "End my suffering.",
            colorOpacity: 0.5
        ),
    ]

    var body: some View {
        ZStack {
            BackgroundView()

            VStack (spacing: 20){
                TitleView()

                VStack(alignment: .leading, spacing: 25) {
                    MessagesView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

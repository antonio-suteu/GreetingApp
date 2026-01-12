//
//  TextView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 11/01/26.
//

import SwiftUI

struct TextView: View {
    let displayText: String
    // @State lets me change the variable in the 'onTapGesture'
    @State var colorOpacity: Double

    var body: some View {
        Text(displayText)
            .font(.largeTitle)
            .fontWeight(.thin)
            .padding()
            .background(.red.opacity(colorOpacity))
            .cornerRadius(5)
            .shadow(
                color: .red,
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

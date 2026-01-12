//
//  TitleView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 11/01/26.
//

import SwiftUI

struct TitleView: View {
    
    // State vars
    @State private var isRotated: Bool = true
    @State private var subtitle = "— Exploring iOS Programming —"
    let subtitles: [String] = [
        "— Learning to make napalm —",
        "— Exploring the wilderness —",
        "— Wearning socks with sandals —",
        "— Feeling existential dread —"
    ]
    
    // computed property
    var angle: Angle {
        isRotated ? .zero : Angle.degrees(180)
    }
    
    var body: some View {
        Image(systemName: "face.dashed")
            .font(.system(size: 60))
            .rotationEffect(angle)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }

        Text(subtitle)
            .fontWeight(.semibold)
            .fontDesign(.monospaced)
            .onTapGesture {
                subtitle = subtitles.randomElement() ?? subtitle
            }
            .padding()
    }
}

#Preview {
    TitleView()
}

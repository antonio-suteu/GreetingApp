//
//  BackgroundView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 11/01/26.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [.yellow, .orange],
           startPoint: .topLeading,
           endPoint: .bottomTrailing
        )
        .opacity(0.8)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}

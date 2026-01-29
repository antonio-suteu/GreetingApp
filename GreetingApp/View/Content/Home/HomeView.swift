//
//  HomeView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 29/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            BackgroundView()

            VStack (spacing: 20){
                TitleView()

                VStack(alignment: .leading, spacing: 25) {
                    MessagesView()
                    // GridView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}

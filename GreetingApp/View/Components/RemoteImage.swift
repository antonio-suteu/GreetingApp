//
//  RemoteImage.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 05/02/26.
//

import SwiftUI

struct RemoteImage: View {

    let imageUrl: String?
    var width: CGFloat = 75
    var height: CGFloat = 75
    var cornerRadius: CGFloat = 15

    var body: some View {
        
        AsyncImage(url: URL(string: imageUrl ?? "")) { image in
            image  .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipped()
                .clipShape(.rect(cornerRadius: cornerRadius))
        } placeholder: {
            Image(systemName: "photo")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: width, height: height)
                .background(Color.gray)
                .clipped()
                .clipShape(.rect(cornerRadius: cornerRadius))
              
        }
        
    }
}

#Preview {
    RemoteImage(imageUrl: "https://example.com/image.jpg")
}

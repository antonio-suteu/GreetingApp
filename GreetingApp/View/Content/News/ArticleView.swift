//
//  ArticleView.swift
//  GreetingApp
//
//  Created by Antonio Suteu on 03/02/26.
//

import SwiftUI

struct ArticleView: View {
    @Binding var article: ArticleElement

    var body: some View {
        HStack(spacing: 15) {
            RemoteImage(imageUrl: article.urlToImage)
            Text(article.title).fontWeight(.semibold).lineLimit(4)
        }
    }
}

// #Preview {
//
//    @Previewable @State var article: ArticleElement = ArticleElement(id: <#T##UUID#>, source: <#T##Source#>, author: <#T##String?#>, title: <#T##String#>, description: <#T##String?#>, url: <#T##String#>, urlToImage: <#T##String?#>, publishedAt: <#T##Date#>, content: <#T##String?#>)
//
//    ArticleView(article: $article)
// }

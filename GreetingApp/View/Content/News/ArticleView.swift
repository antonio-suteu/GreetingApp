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
        Text(article.title)
    }
}

//#Preview {
//    
//    @Previewable @State var article: ArticleElement = ArticleElement(id: <#T##UUID#>, source: <#T##Source#>, author: <#T##String?#>, title: <#T##String#>, description: <#T##String?#>, url: <#T##String#>, urlToImage: <#T##String?#>, publishedAt: <#T##Date#>, content: <#T##String?#>)
//    
//    ArticleView(article: $article)
//}

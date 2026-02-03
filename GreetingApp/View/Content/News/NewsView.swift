import SwiftUI

struct NewsView: View {
    
    @State private var vm = ArticleViewModel(service: MockArticleService())
    
    var body: some View {
        ZStack {
            BackgroundView()

            //Text("Top Headlines").font(.title).fontWeight(.semibold)
            
            VStack {
                Button ("Get news") {
                    Task {
                        await vm.fetch()
                    }
                }
                
                if vm.isLoading {
                    ProgressView("Loading...")
                } else {
                    List {
                        ForEach(vm.data?.articles ?? []) { article in
                            // TODO: Article row view
    
                            ArticleView(article: .constant(article))
                            
                            //Text(article.title)
                        }
                    }
                }
            }
            
   
           
        }
        .alert(vm.errorMessage ?? "Error def", isPresented: .constant(vm.errorMessage != nil)) {
            Button("Okay") {
                vm.errorMessage = nil
            }
        }
//        .task {
//            await vm.fetchData()
//        }
    }
}

#Preview {
    NewsView()
}

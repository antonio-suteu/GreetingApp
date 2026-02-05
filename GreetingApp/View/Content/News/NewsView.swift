import SwiftUI

struct NewsView: View {
    
    // Real API data
    //@State private var vm = ArticleViewModel()
    
    // Mock data
    @State private var vm = ArticleViewModel(service: MockArticleService())

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Text("Top Headlines").font(.title).fontWeight(.semibold)

                if vm.isLoading {
                    ProgressView("Loading...")
                } else {
                    List {
                        ForEach(vm.data?.articles ?? []) { article in
                            ArticleView(article: .constant(article))
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
        .task {
            await vm.fetch()
        }
    }
}

#Preview {
    NewsView()
}

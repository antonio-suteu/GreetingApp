import SwiftUI

/// This is the background view which contains a linear gradient
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

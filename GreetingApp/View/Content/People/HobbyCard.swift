import SwiftUI

struct HobbyCard: View {
    let name: String
    let hobbyName: LocalizedStringKey
    let hobbyImgName: String

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(name.capitalized).font(.largeTitle)
                Text(hobbyName).font(.title3).foregroundStyle(.orange)
            }

            Spacer()

            Image(systemName: hobbyImgName)
                .imageScale(.large)
                .padding()
                .background(Circle().stroke())
        }
        .padding()
        .cornerRadius(20)
        .foregroundStyle(.white)
        .listRowBackground(Color.black.opacity(0.75))
    }
}

#Preview {
    VStack {
        HobbyCard(name: "Henry", hobbyName: "Tennis", hobbyImgName: "figure.tennis")
    }
    .background(Color.black.opacity(0.75))
}

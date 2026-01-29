import SwiftUI

struct PeopleView: View {
    // sample data
    @State private var people: [Person] =
        [
            .init(name: "Bobby", hobby: "Running", hobbyImage: "figure.roll.runningpace"),
            .init(name: "Alice", hobby: "Basketball", hobbyImage: "basketball.fill"),
            .init(name: "Mark", hobby: "Cycling", hobbyImage: "syringe.fill"),
            .init(name: "Tom", hobby: "Baseball", hobbyImage: "figure.baseball"),
        ]

    var body: some View {
        ZStack {
            BackgroundView()

            List {
                ForEach(people) { person in
                    HobbyCard(
                        name: person.name,
                        hobbyName: person.hobby,
                        hobbyImgName: person.hobbyImage
                    )
                }
//                   .onMove { indices, newOffset in
//                       // Update the items array based on source and destination indices.
//                       people.move(fromOffsets: indices, toOffset: newOffset)
//                   }
            }
            .scrollContentBackground(.hidden)
            .listRowSpacing(10)
        }
    }
}

#Preview {
    PeopleView()
}

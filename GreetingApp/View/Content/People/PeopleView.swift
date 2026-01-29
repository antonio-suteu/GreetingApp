import SwiftUI

struct PeopleView: View {
    // sample data
    let people: [Person] =
        [
            .init(name: "Bobby", hobby: "Running", hobbyImage: "figure.roll.runningpace"),
            .init(name: "Mark", hobby: "Basketball", hobbyImage: "basketball.fill"),
            .init(name: "Alice", hobby: "Cycling", hobbyImage: "bicycle"),
            .init(name: "Tom", hobby: "Baseball", hobbyImage: "figure.baseball"),
        ]

    var body: some View {
        ZStack {
            BackgroundView()
            
            List(people) { person in
                HobbyCard(
                    name: person.name,
                    hobbyName: person.hobby?.capitalized ?? "",
                    hobbyImgName: person.hobbyImage ?? ""
                )
            }
            .scrollContentBackground(.hidden)
            .listRowSpacing(10)
        }
    }
}

#Preview {
    PeopleView()
}

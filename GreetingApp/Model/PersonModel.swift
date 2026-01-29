import Foundation


struct Person: Identifiable {
    let id = UUID()
    let name: String
    let hobby: String?
    let hobbyImage: String?
}

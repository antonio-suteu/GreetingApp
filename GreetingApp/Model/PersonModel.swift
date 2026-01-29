import Foundation
import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    
    let name: String
    let hobby: LocalizedStringKey
    let hobbyImage: String
}

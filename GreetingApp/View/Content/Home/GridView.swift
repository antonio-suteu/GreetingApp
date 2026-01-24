import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            GridRow {
                Rect(color: .green, count: 2, total:2)
            }
            
            GridRow {
                Rect(color: .teal, count: 1, total: 2)
                Rect(color: .indigo, count: 1, total: 2)
            }
        }.padding()
    }
}

struct Rect: View {
    let color: Color
    let count: Int
    let total: Int
    
    var text: String {
        "\(count) out of \(total)"
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color.opacity(0.7))
            .overlay {
                Text(text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .gridCellColumns(count)
    }
}

#Preview {
    GridView()
}

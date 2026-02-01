import SwiftUI

struct AlignModifier: ViewModifier {
    let alignment: Alignment
    init(alignment: Alignment = .center) {
        self.alignment = alignment
    }

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

// extended the view to offer a function called 'align', this helps
// make code less verbose when setting alignment for Modifier
extension View {
    func align(alignment: Alignment = .center) -> some View {
        modifier(AlignModifier(alignment: alignment))
    }
}

struct Align_Modifier: View {
    var body: some View {
        
        ZStack {
            Text("Top Left").align(alignment: .topLeading).padding()
            Text("Top Center").align(alignment: .top).padding()
            Text("Top Right").align(alignment: .topTrailing).padding()
            
            Text("Center Left").align(alignment: .leading).padding()
            Text("Center").align(alignment: .center).padding()
            Text("Center Right").align(alignment: .trailing).padding()
            
            Text("Bottom Left").align(alignment: .bottomLeading).padding()
            Text("Bottom").align(alignment: .bottom).padding()
            Text("Bottom Right").align(alignment: .bottomTrailing).padding()
        }
      
    }
}

#Preview {
    Align_Modifier()
}

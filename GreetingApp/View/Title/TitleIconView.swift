import SwiftUI

struct TitleIconView: View {
    /// Tracks whether the face icon is in its original orientation or rotated 180 degrees.
    @Binding var isRotated: Bool

    /// Returns the rotation angle based on the current rotation state.
    ///
    /// - Returns: `.zero` when not rotated, or 180 degrees when rotated.
    var angle: Angle {
        isRotated ? .zero : Angle.degrees(180)
    }
    
    // Device orientation information for conditional layout and styling.
    @Environment(\.deviceOrientation) var deviceOrientation

    var iconSize: CGFloat {
        deviceOrientation.isTablet ? 120 : 60
    }

    var body: some View {
        // Face icon that rotates when tapped
        Image(systemName: "face.dashed")
            .font(.system(size: 60))
            .rotationEffect(angle)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }
    }
}

#Preview {
    @Previewable @State var isRotated: Bool = true
    TitleIconView(isRotated: $isRotated)
}

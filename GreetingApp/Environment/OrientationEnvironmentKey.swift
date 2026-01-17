import SwiftUI

/// Represents device orientation and size class information.
///
/// This structure encapsulates information about the current device's
/// orientation and form factor, allowing views to make layout and styling
/// decisions based on the device type and orientation.
struct DeviceOrientation {
    /// Whether the device is an iPhone in portrait orientation.
    ///
    /// True when horizontalSizeClass is .compact and verticalSizeClass is .regular.
    let isPortraitPhone: Bool

    /// Whether the device is an iPad or iPad Pro (any orientation).
    ///
    /// True when both horizontalSizeClass and verticalSizeClass are .regular.
    let isTablet: Bool
}

/// Environment key for providing device orientation information to the view hierarchy.
struct OrientationEnvironmentKey: EnvironmentKey {
    static let defaultValue: DeviceOrientation = .init(
        isPortraitPhone: false,
        isTablet: false
    )
}

/// Extension to EnvironmentValues for convenient access to device orientation.
extension EnvironmentValues {
    var deviceOrientation: DeviceOrientation {
        get { self[OrientationEnvironmentKey.self] }
        set { self[OrientationEnvironmentKey.self] = newValue }
    }
}

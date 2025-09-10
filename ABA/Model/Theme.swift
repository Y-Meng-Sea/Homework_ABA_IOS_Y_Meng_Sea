import SwiftUI
import Foundation

struct Theme: Identifiable {
    var id = UUID()
    var themeName: String
    var themeImage: String
}

struct CustomTheme: Identifiable {
    var id = UUID()
    var Image: Image
    var ThemeName: String
}

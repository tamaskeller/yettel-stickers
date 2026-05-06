import SwiftUI

extension Font {
    enum Yettel {
        static func regular(size: CGFloat) -> Font {
            .system(size: size, weight: .regular, design: .default)
        }

        static func bold(size: CGFloat) -> Font {
            .system(size: size, weight: .bold, design: .default)
        }
    }
}

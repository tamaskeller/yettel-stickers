import SwiftUI

public struct RoundedCornerModifier: ViewModifier {
    let radius: CGFloat
    let corners: UIRectCorner
    let strokeColor: Color
    let lineWidth: CGFloat

    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedCorner(radius: radius, corners: corners))
            .overlay(
                RoundedCorner(radius: radius, corners: corners)
                    .stroke(strokeColor, lineWidth: lineWidth)
            )
    }
}

extension View {
    public func roundedCorners(
        radius: CGFloat,
        corners: UIRectCorner = .allCorners,
        strokeColor: Color = Color.clear,
        lineWidth: CGFloat = 1.0
    ) -> some View {
        self.modifier(
            RoundedCornerModifier(
                radius: radius,
                corners: corners,
                strokeColor: strokeColor,
                lineWidth: lineWidth
            )
        )
    }
}

public struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

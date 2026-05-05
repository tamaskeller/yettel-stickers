import SwiftUI

enum RoundedButtonStyle {
    case primary
    case secondary
}

struct RoundedButton<Content: View>: View {
    private let style: RoundedButtonStyle
    private let content: Content
    private let action: () -> Void

    init(style: RoundedButtonStyle = .primary, @ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.style = style
        self.content = content()
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }) {
            content
        }
        .padding(.horizontal)
        .foregroundStyle(style == .primary ? .white : Color.Yettel.primaryBlue)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(style == .primary ? Color.Yettel.primaryBlue : Color.white)
        .roundedCorners(radius: 24, strokeColor: .Yettel.primaryBlue, lineWidth: 1)
    }
}

#Preview {
    RoundedButton(content: {
        Text("ASDASD")
    }) {}
}

import SwiftUI

struct RoundedCardView<Content: View>: View {
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color.white)
            .roundedCorners(radius: 8)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    RoundedCardView {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Navigate!") {
            }
        }
    }
}

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
                .ignoresSafeArea()

            ProgressView()
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
        }
    }
}

#Preview {
    LoadingView()
}

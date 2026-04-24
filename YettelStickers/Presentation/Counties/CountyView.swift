import SwiftUI

struct CountyView: View {

    let viewModel: CountyViewModelProtocol

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Counties come here!")
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}

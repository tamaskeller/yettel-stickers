import SwiftUI

struct HomeView: View {

    @State private var path = NavigationPath()

    let viewModel: HomeViewModelProtocol

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")

                Button("Navigate!") {
                    path.append("counties")
                }
            }
            .padding()
            .onAppear {
                viewModel.onAppear()
            }
            .navigationDestination(for: String.self) { value in
                if value == "counties" {
                    CountyView(viewModel: DependencyInjector.shared.resolve(CountyViewModelProtocol.self))
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(repository: HighwayRepository(networkService: HighwayNetworkService())))
}

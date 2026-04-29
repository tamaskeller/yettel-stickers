import SwiftUI

struct HomeView: View {

    @State private var path = NavigationPath()

    let viewModel: HomeViewModelProtocol

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Styles.Colors.backgroundGrey
                    .edgesIgnoringSafeArea(.all)
                contentView
            }
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

    private var contentView: some View {
        ScrollView {
            VStack() {
                VehicleCardView(licensePlateNumber: "OOF", ownerName: "669")
                CountryWideVignettesListView(purchaseAction: {
                    path.append("counties")
                })
                CountyVignettesMenuView {
                    path.append("counties")
                }
            }
            .frame(maxWidth: .infinity)
                    .padding()
            .background(Color.yellow)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(repository: HighwayRepository(networkService: HighwayNetworkService())))
}

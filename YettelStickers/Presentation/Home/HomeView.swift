import SwiftUI

struct HomeView: View {

    @State private var path = NavigationPath()

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Assets.Colors.backgroundGrey
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
        VStack {
            if
                let plateNumber = viewModel.vehicleInformation?.plate,
                let ownerName = viewModel.vehicleInformation?.name {
                VehicleCardView(licensePlateNumber: plateNumber, ownerName: ownerName)
            }
            if let vignettes = viewModel.vignetteInformation {
                CountryWideVignettesListView(
                    vignettes: vignettes.payload.highwayVignettes.filter {
                        $0.vignetteType.count == 1
                    },
                    purchaseAction: {
                        path.append("counties")
                    },
                    selectedVignette: $viewModel.selectedVignette)
            }
            CountyVignettesMenuView {
                path.append("counties")
            }
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: DependencyInjector.shared.resolve(HighwayRepositoryProtocol.self)))
}

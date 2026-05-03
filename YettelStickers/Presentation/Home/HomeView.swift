import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ZStack {
            Assets.Colors.backgroundGrey
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                contentView
            }
        }
        .onAppear {
            viewModel.onAppear()
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
                        coordinator.pushCounties(counties: vignettes.payload.counties)
                    },
                    selectedVignette: $viewModel.selectedVignette)
                CountyVignettesMenuView {
                    coordinator.pushCounties(counties: vignettes.payload.counties)
                }
            }
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: DependencyInjector.shared.resolve(HighwayRepositoryProtocol.self)))
}

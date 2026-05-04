import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ZStack {
            Color.Yettel.backgroundGrey
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                contentView
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("STICKERS!")
    }

    @ViewBuilder
    private var contentView: some View {
        if let presentationData = viewModel.presentationData {
            VStack {
                let plateNumber = presentationData.vehicleData.vehiclePlateNumber
                let ownerName = presentationData.vehicleData.vehicleOwnerName
                VehicleCardView(licensePlateNumber: plateNumber, ownerName: ownerName)

                if let vignettes = viewModel.presentationData?.vignetteData {
                    CountryWideVignettesListView(
                        vignettes: vignettes.values.filter {
                            $0.isSingular
                        },
                        purchaseAction: {
                            coordinator.pushCounties(vignetteInfo: presentationData)
                        },
                        selectedVignette: $viewModel.selectedVignette)
                    CountyVignettesMenuView {
                        coordinator.pushCounties(vignetteInfo: presentationData)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: DependencyInjector.shared.resolve(HighwayRepositoryProtocol.self)))
}

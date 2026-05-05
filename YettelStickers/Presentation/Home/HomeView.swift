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
        .alert(item: $viewModel.fetchError) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    @ViewBuilder
    private var contentView: some View {
        if let presentationData = viewModel.presentationData {
            ZStack {
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
                                coordinator.pushConfirmation(selection: Set([viewModel.selectedVignetteIdentifier!]),
                                                             response: viewModel.presentationData!)
                            },
                            selectedVignetteIdentifier: $viewModel.selectedVignetteIdentifier)
                        CountyVignettesMenuView {
                            coordinator.pushCounties(vignetteInfo: presentationData)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 12)

                if viewModel.isLoading {
                    LoadingView()
                }
            }
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: DependencyInjector.shared.resolve(HighwayRepositoryProtocol.self)))
}

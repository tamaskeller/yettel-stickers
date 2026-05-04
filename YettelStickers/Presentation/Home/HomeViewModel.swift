import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var vignetteInformation: VignetteInformationResponse? { get }
    var vehicleInformation: VehicleInformationResponse? { get }
    func onAppear()
}

final class HomeViewModel: HomeViewModelProtocol {

    let repository: HighwayRepositoryProtocol

    @Published var vignetteInformation: VignetteInformationResponse?
    @Published var vehicleInformation: VehicleInformationResponse?
    @Published var selectedVignette: VignetteInformationHighwayVignette?

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
        Task {
            async let vignetteResponse = repository.getVignetteInformation()
            async let vehicleResponse = repository.getVehicleInformation()
            let (vignettes, vehicle) = try await (vignetteResponse, vehicleResponse)
            await MainActor.run {
                vehicleInformation = vehicle
                vignetteInformation = vignettes
                selectedVignette = vignettes.payload.highwayVignettes.first
                //debugPrint(vignettes)
            }
        }
    }
}

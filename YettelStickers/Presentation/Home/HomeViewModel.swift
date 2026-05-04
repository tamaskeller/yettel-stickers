import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var presentationData: VignettePresentationData? { get }
    func onAppear()
}

final class HomeViewModel: HomeViewModelProtocol {

    let repository: HighwayRepositoryProtocol

    @Published var presentationData: VignettePresentationData?
    @Published var selectedVignette: VignettePresentationVignetteData?

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
        Task {
            async let vignetteResponse = repository.getVignetteInformation()
            async let vehicleResponse = repository.getVehicleInformation()
            let (vignettes, vehicle) = try await (vignetteResponse, vehicleResponse)
            await MainActor.run {
                let counties = vignettes.payload.counties.map {
                    VignettePresentationCountyData(id: $0.id, name: $0.name)
                }
                let vehicleData = VignettePresentationVehicleData(
                    vehicleOwnerName: vehicle.name,
                    vehiclePlateNumber: vehicle.plate)
                
                let vignetteData = transformVignettes(input: vignettes.payload.highwayVignettes)
                presentationData = .init(counties: counties, vehicleData: vehicleData, vignetteData: vignetteData)
                selectedVignette = vignetteData.values.first
            }
        }
    }

    func transformVignettes(
        input: [VignetteInformationHighwayVignette]
    ) -> [String: VignettePresentationVignetteData] {
        let flattened = input.flatMap { item in
            let isSingle = item.vignetteType.count == 1
            return item.vignetteType.map { type in
                (
                    type,
                    VignettePresentationVignetteData(
                        vignetteType: type,
                        cost: item.cost,
                        trxFee: item.trxFee,
                        sum: item.sum,
                        isSingular: isSingle
                    )
                )
            }
        }
        return Dictionary(uniqueKeysWithValues: flattened)
    }
}

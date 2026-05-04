import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var presentationData: VignettePresentationData? { get }
    var isLoading: Bool { get }
    func onAppear()
}

final class HomeViewModel: HomeViewModelProtocol {

    let repository: HighwayRepositoryProtocol
    var isLoading: Bool = false

    @Published var presentationData: VignettePresentationData?
    @Published var selectedVignetteIdentifier: String?

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
        isLoading = true
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

                let vignetteData = makeVignetteDictionary(from: vignettes.payload.highwayVignettes)
                presentationData = .init(counties: counties, vehicleData: vehicleData, vignetteData: vignetteData)
                selectedVignetteIdentifier = defaultVignetteType(from: vignettes.payload.highwayVignettes)
                isLoading = false
            }
        }
    }

    func makeVignetteDictionary(
        from input: [VignetteInformationHighwayVignette]
    ) -> [String: VignettePresentationVignetteData] {

        let flattened = input.flatMap { item in
            item.vignetteType.map { type in
                (
                    type,
                    VignettePresentationVignetteData(
                        vignetteType: type,
                        cost: item.cost,
                        trxFee: item.trxFee,
                        sum: item.sum,
                        isSingular: item.vignetteType.count == 1
                    )
                )
            }
        }
        return Dictionary(uniqueKeysWithValues: flattened)
    }

    func defaultVignetteType(
        from input: [VignetteInformationHighwayVignette]
    ) -> String? {
        input.first(where: { $0.vignetteType.count == 1 })?
            .vignetteType.first
    }
}

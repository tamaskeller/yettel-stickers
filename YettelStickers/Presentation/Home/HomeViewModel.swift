import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var presentationData: VignettePresentationData? { get }
    var fetchError: ErrorWrapper? { get }
    var isLoading: Bool { get }
    func onAppear()
}

final class HomeViewModel: HomeViewModelProtocol {

    let repository: HighwayRepositoryProtocol

    @Published var presentationData: VignettePresentationData?
    @Published var selectedVignetteIdentifier: String?
    @Published var isLoading: Bool = false
    @Published var fetchError: ErrorWrapper?

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
        isLoading = true
        Task {
            async let vignetteResponse = repository.getVignetteInformation()
            async let vehicleResponse = repository.getVehicleInformation()
            do {
                let (vignettes, vehicle) = try await (vignetteResponse, vehicleResponse)
                let counties = vignettes.payload.counties.map {
                    VignettePresentationCountyData(id: $0.id, name: $0.name)
                }
                let vehicleData = VignettePresentationVehicleData(
                    vehicleOwnerName: vehicle.name,
                    vehiclePlateNumber: vehicle.plate)
                let vignetteData = makeVignetteDictionary(from: vignettes.payload.highwayVignettes)
                await MainActor.run {
                    presentationData = .init(counties: counties, vehicleData: vehicleData, vignetteData: vignetteData)
                    selectedVignetteIdentifier = defaultVignetteType(from: vignettes.payload.highwayVignettes)
                    isLoading = false
                }
            } catch let error {
                await MainActor.run {
                    fetchError = ErrorWrapper(message: error.localizedDescription)
                }
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
                        vehicleCategory: item.vehicleCategory,
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

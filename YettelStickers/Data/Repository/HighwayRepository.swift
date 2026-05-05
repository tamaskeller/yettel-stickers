protocol HighwayRepositoryProtocol {
    func getVignetteInformation() async throws -> VignetteInformationResponse
    func getVehicleInformation() async throws -> VehicleInformationResponse
    func orderVignettes(from request: VignetteOrderRequestData) async throws -> VignetteOrderResponse
}

final class HighwayRepository: HighwayRepositoryProtocol {

    let networkService: HighwayNetworkServiceProtocol

    init(networkService: HighwayNetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getVignetteInformation() async throws -> VignetteInformationResponse {
        try await networkService.performRequest(endpoint: .vignetteInformation,
                                                returnType: VignetteInformationResponse.self)
    }
    
    func getVehicleInformation() async throws -> VehicleInformationResponse {
        try await networkService.performRequest(endpoint: .vehicleInformation,
                                                returnType: VehicleInformationResponse.self)
    }

    func orderVignettes(from request: VignetteOrderRequestData) async throws -> VignetteOrderResponse {
        try await networkService.performRequest(endpoint: .order(request),
                                                returnType: VignetteOrderResponse.self)
    }
}

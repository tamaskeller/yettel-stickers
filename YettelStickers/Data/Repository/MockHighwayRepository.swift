import Foundation

public final class MockHighwayRepository: HighwayRepositoryProtocol {
    public var shouldThrowError = false
    public var mockResponse: VignetteOrderResponse?

    public func getVignetteInformation() async throws -> VignetteInformationResponse {
        throw NSError(domain: "test", code: 1, userInfo: nil)
    }

    public func getVehicleInformation() async throws -> VehicleInformationResponse {
        throw NSError(domain: "test", code: 1, userInfo: nil)
    }

    public func orderVignettes(from request: VignetteOrderRequestData) async throws -> VignetteOrderResponse {
        if shouldThrowError {
            throw NSError(domain: "test", code: 1, userInfo: nil)
        }
        return mockResponse!
    }

    public init(shouldThrowError: Bool = false, mockResponse: VignetteOrderResponse? = nil) {
        self.shouldThrowError = shouldThrowError
        self.mockResponse = mockResponse
    }
}

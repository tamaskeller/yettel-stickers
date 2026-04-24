import Foundation

public struct VehicleInformationResponse: Codable, Hashable {

    public var statusCode: String
    public var internationalRegistrationCode: String
    public var type: String
    public var name: String
    public var plate: String
    public var country: VehicleInformationCountry
    public var vignetteType: String
}


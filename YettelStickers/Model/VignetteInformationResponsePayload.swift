import Foundation

public struct VignetteInformationResponsePayload: Codable, Hashable {

    public var highwayVignettes: [VignetteInformationHighwayVignette]
    public var vehicleCategories: [VignetteInformationVehicleCategory]
    public var counties: [VignetteInformationCounty]
}


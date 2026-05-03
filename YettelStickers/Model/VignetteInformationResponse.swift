import Foundation

public struct VignetteInformationResponse: Codable, Hashable {

    public var requestId: String
    public var statusCode: String
    public var payload: VignetteInformationResponsePayload
}


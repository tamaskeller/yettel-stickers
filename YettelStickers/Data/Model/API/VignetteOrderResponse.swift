import Foundation

public struct VignetteOrderResponse: Codable, Hashable {

    public var statusCode: String
    public var receivedOrders: [VignetteOrderRequestDataItem]
}


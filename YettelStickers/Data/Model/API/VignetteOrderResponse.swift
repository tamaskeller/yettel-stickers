import Foundation

public struct VignetteOrderResponse: Codable, Hashable {

    public var statusCode: String
    public var receivedOrders: [VignetteOrderRequestDataItem]

    public init(statusCode: String, receivedOrders: [VignetteOrderRequestDataItem]) {
        self.statusCode = statusCode
        self.receivedOrders = receivedOrders
    }
}


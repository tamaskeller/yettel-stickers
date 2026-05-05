import Foundation

public struct VignetteOrderRequestData: Codable, Hashable {

    public var highwayOrders: [VignetteOrderRequestDataItem]

    func toDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return json as? [String: Any]
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}


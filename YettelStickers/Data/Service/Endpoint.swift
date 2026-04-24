import Alamofire

enum Endpoint {
    case vignetteInformation
    case vehicleInformation

    var path: String {
        switch self {
        case .vignetteInformation:
            return "/v1/highway/info"
        case .vehicleInformation:
            return "/v1/highway/vehicle"
        }
    }

    var method: HTTPMethod {
        return .get
    }
}

import Alamofire

enum Endpoint {
    case vignetteInformation
    case vehicleInformation
    case order(VignetteOrderRequestData)

    var path: String {
        switch self {
        case .vignetteInformation:
            return "/v1/highway/info"
        case .vehicleInformation:
            return "/v1/highway/vehicle"
        case .order:
            return "/v1/highway/order"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .vignetteInformation, .vehicleInformation:
            return .get
        case .order:
            return .post
        }
    }

    var parameters: Parameters? {
        switch self {
        case .order(let request):
            return request.toDictionary()
        default:
            return nil
        }
    }
}

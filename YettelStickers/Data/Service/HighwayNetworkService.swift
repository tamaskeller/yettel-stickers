import Alamofire
import Foundation

protocol HighwayNetworkServiceProtocol {
    func performRequest<T: Decodable>(endpoint: Endpoint, returnType: T.Type) async throws -> T
}

final class HighwayNetworkService: HighwayNetworkServiceProtocol {
    private let baseUrl = "http://0.0.0.0:8080"

    func performRequest<T: Decodable>(endpoint: Endpoint, returnType: T.Type) async throws -> T {
        let response = try await request(for: endpoint).serializingDecodable(returnType).response
        switch response.result {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }

    private func request(for endpoint: Endpoint) async throws -> DataRequest {
        AF.request(baseUrl + endpoint.path, method: endpoint.method)
    }
}

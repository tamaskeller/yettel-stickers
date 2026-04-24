import SwiftUI
import Alamofire

@main
struct YettelStickersApp: App {

    init() {
    }

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: DependencyInjector.shared.resolve(HomeViewModelProtocol.self))
        }
    }

    private func testAF() async {
        async let response1 = await AF.request("http://0.0.0.0:8080/v1/highway/info", method: .get).serializingDecodable(VignetteInformationResponse.self).response
        async let response2 = await AF.request("http://0.0.0.0:8080/v1/highway/vehicle", method: .get).serializingDecodable(VehicleInformationResponse.self).response

        let request = PostHighwayOrderRequest(
            highwayOrders: [
                PostHighwayOrderRequestHighwayOrdersInner(type: "DAY", category: "CAR", cost: 5150)
            ])
        let response3 = await AF.request("http://0.0.0.0:8080/v1/highway/order", method: .post, parameters: request, encoder: JSONParameterEncoder()).serializingDecodable(PostHighwayOrder200Response.self).response
        let allResponses = await(response1, response2, response3)
        debugPrint(allResponses)

        debugPrint("#7 \(response3.result)")
    }
}

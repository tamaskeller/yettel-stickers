import SwiftUI
import Alamofire

@main
struct YettelStickersApp: App {

    @StateObject private var coordinator = AppCoordinator()

    init() {
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                HomeView(viewModel: DependencyInjector.shared.resolve((any HomeViewModelProtocol).self) as! HomeViewModel)
                    .environmentObject(coordinator)
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .home:
                            HomeView(viewModel: DependencyInjector.shared.resolve((any HomeViewModelProtocol).self) as! HomeViewModel)
                        case .counties(let counties):
                            CountyView(
                              viewModel:
                                DependencyInjector.shared.resolve((any CountyViewModelProtocol).self, argument: counties) as! CountyViewModel)
                                .environmentObject(coordinator)
                        case .confirmation(let preorder):
                            ConfirmationView(
                                viewModel:
                                    DependencyInjector.shared.resolve(ConfirmationViewModel.self))
                                .environmentObject(coordinator)
                        }
                    }
            }
        }
    }

//    private func testAF() async {
//        async let response1 = await AF.request("http://0.0.0.0:8080/v1/highway/info", method: .get).serializingDecodable(VignetteInformationResponse.self).response
//        async let response2 = await AF.request("http://0.0.0.0:8080/v1/highway/vehicle", method: .get).serializingDecodable(VehicleInformationResponse.self).response
//
//        let request = PostHighwayOrderRequest(
//            highwayOrders: [
//                PostHighwayOrderRequestHighwayOrdersInner(type: "DAY", category: "CAR", cost: 5150)
//            ])
//        let response3 = await AF.request("http://0.0.0.0:8080/v1/highway/order", method: .post, parameters: request, encoder: JSONParameterEncoder()).serializingDecodable(PostHighwayOrder200Response.self).response
//        let allResponses = await(response1, response2, response3)
//        debugPrint(allResponses)
//
//        debugPrint("#7 \(response3.result)")
//    }
}

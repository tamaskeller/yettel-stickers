import SwiftUI
import Alamofire

@main
struct YettelStickersApp: App {

    @StateObject private var coordinator = AppCoordinator()

    init() {
        customizeAppearance()
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
                                .environmentObject(coordinator)
                        case .counties(let vignetteInfo):
                            let viewModel = DependencyInjector.shared.resolve((any CountyViewModelProtocol).self, vignetteInfo) as! CountyViewModel
                            CountyView(viewModel: viewModel)
                                .environmentObject(coordinator)
                        case .confirmation(let selectionInfo, let vignetteInfo):
                            ConfirmationView(
                                viewModel:
                                    DependencyInjector.shared.resolve((any ConfirmationViewModelProtocol).self, selectionInfo, vignetteInfo) as! ConfirmationViewModel)
                                .environmentObject(coordinator)
                        }
                    }
            }
        }
    }

    private func customizeAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Assets.Colors.lime ?? .green)

        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(Assets.Colors.primaryBlue ?? .blue)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(Assets.Colors.primaryBlue ?? .blue)
        ]

        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.compactAppearance = appearance
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

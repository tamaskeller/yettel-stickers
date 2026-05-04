import SwiftUI

@MainActor
class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func pushCounties(vignetteInfo: VignetteInformationResponse) {
        path.append(AppRoute.counties(vignetteInfo: vignetteInfo))
    }

    func pushConfirmation(selection: Set<String>, response: VignetteInformationResponse) {
        path.append(AppRoute.confirmation(selectionIdentifiers: selection, vignetteInfo: response))
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }
}

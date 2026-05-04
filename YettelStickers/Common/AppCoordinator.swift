import SwiftUI

@MainActor
class AppCoordinator: ObservableObject {
    @Published var path: [AppRoute] = []

    func pushCounties(vignetteInfo: VignettePresentationData) {
        path.append(AppRoute.counties(vignetteInfo: vignetteInfo))
    }

    func pushConfirmation(selection: Set<String>, response: VignettePresentationData) {
        path.append(AppRoute.confirmation(selectionIdentifiers: selection,
                                          vignetteInfo: response))
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = []
    }
}

import SwiftUI

@MainActor
class AppCoordinator: ObservableObject {
    @Published var path: [AppRoute] = []

    func pushCounties(vignetteInfo: VignettePresentationData) {
        path.append(.counties(vignetteInfo: vignetteInfo))
    }

    func pushConfirmation(selection: Set<String>, response: VignettePresentationData) {
        path.append(.confirmation(selectionIdentifiers: selection,
                                          vignetteInfo: response))
    }

    func pushSuccess() {
        path.append(.success)
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = []
    }
}

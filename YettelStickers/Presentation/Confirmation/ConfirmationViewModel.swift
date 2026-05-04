import SwiftUI

protocol ConfirmationViewModelProtocol: ObservableObject {
    var vignetteInformation: VignettePresentationData { get }
    var selectionIdenfitiers: Set<String> { get }
}

final class ConfirmationViewModel: ConfirmationViewModelProtocol {

    @Published var selectionIdenfitiers: Set<String>
    @Published var vignetteInformation: VignettePresentationData
    let repository: HighwayRepositoryProtocol

    init(selectionIdentifiers: Set<String>,
         vignetteInformation: VignettePresentationData,
         repository: HighwayRepositoryProtocol) {
            self.selectionIdenfitiers = selectionIdentifiers
            self.vignetteInformation = vignetteInformation
            self.repository = repository
    }
}

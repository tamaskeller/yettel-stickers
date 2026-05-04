import SwiftUI

protocol ConfirmationViewModelProtocol: ObservableObject {
    var vignetteInformation: VignetteInformationResponse { get }
    var selectionIdenfitiers: Set<String> { get }
}

final class ConfirmationViewModel: ConfirmationViewModelProtocol {

    @Published var selectionIdenfitiers: Set<String>
    @Published var vignetteInformation: VignetteInformationResponse
    let repository: HighwayRepositoryProtocol

    init(selectionIdentifiers: Set<String>,
         vignetteInformation: VignetteInformationResponse,
         repository: HighwayRepositoryProtocol) {
            self.selectionIdenfitiers = selectionIdentifiers
            self.vignetteInformation = vignetteInformation
            self.repository = repository
    }
}

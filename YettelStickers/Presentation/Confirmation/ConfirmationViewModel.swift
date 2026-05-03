import SwiftUI

protocol ConfirmationViewModelProtocol: ObservableObject {

    var preorderData: [HighwayTicketPreorder] { get }
}

final class ConfirmationViewModel: ConfirmationViewModelProtocol {

    @Published var preorderData: [HighwayTicketPreorder]
    let repository: HighwayRepositoryProtocol

    init(preorderData: [HighwayTicketPreorder], repository: HighwayRepositoryProtocol) {
        self.preorderData = preorderData
        self.repository = repository
    }
}

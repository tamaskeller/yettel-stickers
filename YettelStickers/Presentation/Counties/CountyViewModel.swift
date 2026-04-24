import SwiftUI

protocol CountyViewModelProtocol {
    func onAppear()
}

final class CountyViewModel: ObservableObject, CountyViewModelProtocol {

    let repository: HighwayRepositoryProtocol

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
    }
}

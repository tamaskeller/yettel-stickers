import SwiftUI

protocol HomeViewModelProtocol {
    func onAppear()
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {

    let repository: HighwayRepositoryProtocol

    init(repository: HighwayRepositoryProtocol) {
        self.repository = repository
    }

    func onAppear() {
        Task {
            let vignetteResponse = try await repository.getVignetteInformation()
            debugPrint(vignetteResponse)
        }
    }
}

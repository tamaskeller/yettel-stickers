import SwiftUI

protocol CountyViewModelProtocol: ObservableObject {
    var currentState: VignetteInformationResponse { get }
    func getCountyVignettePrice(for county: VignetteInformationCounty) -> Float
    func getCurrentOrder() -> Set<String>
}

final class CountyViewModel: CountyViewModelProtocol {

    @Published var currentState: VignetteInformationResponse
    @Published var selectedCounties: Set<VignetteInformationCounty> = []

    init(currentState: VignetteInformationResponse, repository: HighwayRepositoryProtocol) {
        self.currentState = currentState
    }

    func toggle(_ item: VignetteInformationCounty) {
        if selectedCounties.contains(item) {
            selectedCounties.remove(item)
        } else {
            selectedCounties.insert(item)
        }
    }

    func isSelected(_ item: VignetteInformationCounty) -> Bool {
        selectedCounties.contains(item)
    }

    func getCountyVignettePrice(for county: VignetteInformationCounty) -> Float {
        let vignetteType = currentState.payload.highwayVignettes.first(where: {
            $0.vignetteType.contains(county.id)
        })
        return vignetteType?.sum ?? 0
    }

    func getCurrentOrder() -> Set<String> {
        Set(selectedCounties.map({ $0.id }))
    }
}

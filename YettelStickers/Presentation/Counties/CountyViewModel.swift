import SwiftUI

protocol CountyViewModelProtocol: ObservableObject {
    var presentationData: VignettePresentationData { get }
    func getCountyVignettePrice(for county: VignettePresentationCountyData) -> Float
    func getCurrentOrder() -> Set<String>
}

final class CountyViewModel: CountyViewModelProtocol {

    @Published var presentationData: VignettePresentationData
    @Published var selectedCounties: Set<VignettePresentationCountyData> = []

    init(presentationData: VignettePresentationData, repository: HighwayRepositoryProtocol) {
        self.presentationData = presentationData
    }

    func toggle(_ item: VignettePresentationCountyData) {
        if selectedCounties.contains(item) {
            selectedCounties.remove(item)
        } else {
            selectedCounties.insert(item)
        }
    }

    func isSelected(_ item: VignettePresentationCountyData) -> Bool {
        selectedCounties.contains(item)
    }

    func getCountyVignettePrice(for county: VignettePresentationCountyData) -> Float {
        presentationData.vignetteData[county.id]?.sum ?? 0
    }

    func getCurrentOrder() -> Set<String> {
        Set(selectedCounties.map({ $0.id }))
    }
}

import SwiftUI

protocol CountyViewModelProtocol: ObservableObject {
    var counties: [VignetteInformationCounty] { get }
    func getCurrentOrder() -> [VignetteInformationCounty]
    func onAppear()
}

final class CountyViewModel: CountyViewModelProtocol {

    @Published var counties: [VignetteInformationCounty]
    @Published var selectedCounties: Set<VignetteInformationCounty> = []

    init(counties: [VignetteInformationCounty], repository: HighwayRepositoryProtocol) {
        self.counties = counties
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

    func onAppear() {
        debugPrint("#7 COUNTIES: " + "\(counties)")
    }

    func getCurrentOrder() -> [VignetteInformationCounty] {
       Array(selectedCounties)
    }
}

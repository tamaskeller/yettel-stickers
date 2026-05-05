import SwiftUI

protocol ConfirmationViewModelProtocol: ObservableObject {
    var vignetteInformation: VignettePresentationData { get }
    var selectionIdenfitiers: Set<String> { get }
    func getSelectedVignetteTypeName() -> String
    func getSelectedVignetteTypes() -> [VignettePresentationVignetteData]
    func getVignetteItemName(for identifier: String) -> String
    func getVignetteItemBasePriceText(for identifier: String) -> String
    func getTransactionFeeText() -> String
    func getTotalPriceText() -> String
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

    func getSelectedVignetteTypeName() -> String {
        let selectedVignetteTypes = getSelectedVignetteTypes()
        if let firstItem = selectedVignetteTypes.first, firstItem.isSingular {
            return VignetteTypeName(rawValue: firstItem.vignetteType)?.displayName ?? ""
        }
        return VignetteTypeName.county.displayName
    }

    func getSelectedVignetteTypes() -> [VignettePresentationVignetteData] {
        let selectedVignetteTypes = Array(vignetteInformation.vignetteData.filter({
            selectionIdenfitiers.contains($0.key)
        }).values)
        return selectedVignetteTypes
    }

    func getVignetteItemName(for identifier: String) -> String {
        if let singularName = VignetteTypeName(rawValue: identifier) {
            return singularName.displayName
        } else {
            return vignetteInformation.counties.first(where: {
                $0.id == identifier
            })?.name ?? ""
        }
    }

    func getVignetteItemBasePriceText(for identifier: String) -> String {
        return "\(Int(getVignetteItemBasePrice(for: identifier))) Ft"
    }

    func getTransactionFeeText() -> String {
        return "\(Int(getTransactionFee())) Ft"
    }

    func getTotalPriceText() -> String {
        return "\(Int(getTotalPrice())) Ft"
    }

    private func getVignetteItemBasePrice(for identifier: String) -> Float {
        return vignetteInformation.vignetteData[identifier]?.cost ?? 0
    }

    private func getTransactionFee() -> Float {
        return vignetteInformation.vignetteData.values.first?.trxFee ?? 0
    }

    private func getTotalPrice() -> Float {
        let vignettes = getSelectedVignetteTypes()
        return vignettes.map { $0.cost }.reduce(0, +) + getTransactionFee()
    }
}

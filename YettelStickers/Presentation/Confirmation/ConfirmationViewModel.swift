import SwiftUI

public protocol ConfirmationViewModelProtocol: ObservableObject {
    var vignetteInformation: VignettePresentationData { get }
    var selectionIdenfitiers: Set<String> { get }
    var orderResponse: VignetteOrderResponse? { get }
    var orderError: ErrorWrapper? { get }
    var isLoading: Bool { get }
    func confirmPurchase() async
    func getSelectedVignetteTypeName() -> String
    func getSelectedVignetteTypes() -> [VignettePresentationVignetteData]
    func getVignetteItemName(for identifier: String) -> String
    func getVignetteItemBasePriceText(for identifier: String) -> String
    func getTransactionFeeText() -> String
    func getTotalPriceText() -> String
}

public final class ConfirmationViewModel: ConfirmationViewModelProtocol {

    @Published public var selectionIdenfitiers: Set<String>
    @Published public var vignetteInformation: VignettePresentationData
    @Published public var orderResponse: VignetteOrderResponse?
    @Published public var orderError: ErrorWrapper?
    @Published public var isLoading: Bool = false
    let repository: HighwayRepositoryProtocol

    public init(selectionIdentifiers: Set<String>,
         vignetteInformation: VignettePresentationData,
         repository: HighwayRepositoryProtocol) {
            self.selectionIdenfitiers = selectionIdentifiers
            self.vignetteInformation = vignetteInformation
            self.repository = repository
    }

    public func confirmPurchase() async {
        await MainActor.run {
                isLoading = true
                orderError = nil
                orderResponse = nil
            }

            defer {
                Task { @MainActor in
                    isLoading = false
                }
            }

            let orders = getSelectedVignetteTypes().map {
                VignetteOrderRequestDataItem(
                    type: $0.vignetteType,
                    category: $0.vehicleCategory,
                    cost: $0.sum
                )
            }

            let orderRequest = VignetteOrderRequestData(highwayOrders: orders)

            do {
                let response = try await repository.orderVignettes(from: orderRequest)
                await MainActor.run {
                    orderResponse = response
                }
            } catch {
                await MainActor.run {
                    orderError = ErrorWrapper(message: error.localizedDescription)
                }
            }
    }

    public func getSelectedVignetteTypeName() -> String {
        let selectedVignetteTypes = getSelectedVignetteTypes()
        if let firstItem = selectedVignetteTypes.first, firstItem.isSingular {
            return VignetteTypeName(rawValue: firstItem.vignetteType)?.displayName ?? ""
        }
        return VignetteTypeName.county.displayName
    }

    public func getSelectedVignetteTypes() -> [VignettePresentationVignetteData] {
        let selectedVignetteTypes = Array(vignetteInformation.vignetteData.filter({
            selectionIdenfitiers.contains($0.key)
        }).values)
        return selectedVignetteTypes
    }

    public func getVignetteItemName(for identifier: String) -> String {
        if let singularName = VignetteTypeName(rawValue: identifier) {
            return singularName.displayName
        } else {
            return vignetteInformation.counties.first(where: {
                $0.id == identifier
            })?.name ?? ""
        }
    }

    public func getVignetteItemBasePriceText(for identifier: String) -> String {
        return "\(Int(getVignetteItemBasePrice(for: identifier))) Ft"
    }

    public func getTransactionFeeText() -> String {
        return "\(Int(getTransactionFee())) Ft"
    }

    public func getTotalPriceText() -> String {
        return "\(Int(getTotalPrice())) Ft"
    }

    // MARK: - Private

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

import XCTest
import YettelStickers

final class ConfirmationViewModelTests: XCTestCase {

    private var viewModel: ConfirmationViewModel!
    private var repository: MockHighwayRepository!

    override func setUp() {
        super.setUp()

        repository = MockHighwayRepository()

        let vignetteData: [String: VignettePresentationVignetteData] = [
            "WEEK": VignettePresentationVignetteData(
                vignetteType: "WEEK",
                vehicleCategory: "D1",
                cost: 1000,
                trxFee: 100,
                sum: 1000,
                isSingular: true
            )
        ]

        let presentationData = VignettePresentationData(
            counties: [],
            vehicleData: VignettePresentationVehicleData(vehicleOwnerName: "János", vehiclePlateNumber: "ABC-123"),
            vignetteData: vignetteData)

        viewModel = ConfirmationViewModel(
            selectionIdentifiers: ["WEEK"],
            vignetteInformation: presentationData,
            repository: repository
        )
    }

    func test_getSelectedVignetteTypes_returnsCorrectItems() {
        let result = viewModel.getSelectedVignetteTypes()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.vignetteType, "WEEK")
    }

    func test_getTotalPrice_calculatesCorrectly() {
        let total = viewModel.getTotalPriceText()
        XCTAssertEqual(total, "1100 Ft")
    }

    func test_getVignetteItemName_returnsCorrectName_forKnownType() {
        let name = viewModel.getVignetteItemName(for: "WEEK")
        XCTAssertFalse(name.isEmpty)
    }

    func test_confirmPurchase_success_setsOrderResponse() async {
        let expectedResponse = VignetteOrderResponse(statusCode: "OK", receivedOrders: [])
        repository.mockResponse = expectedResponse

        await viewModel.confirmPurchase()

        XCTAssertNotNil(viewModel.orderResponse)
        XCTAssertNil(viewModel.orderError)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_confirmPurchase_failure_setsError() async {
        repository.shouldThrowError = true

        await viewModel.confirmPurchase()

        XCTAssertNotNil(viewModel.orderError)
        XCTAssertNil(viewModel.orderResponse)
        XCTAssertFalse(viewModel.isLoading)
    }
}

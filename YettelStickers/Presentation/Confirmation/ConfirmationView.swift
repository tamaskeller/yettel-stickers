import SwiftUI

struct ConfirmationView: View {

    @StateObject var viewModel: ConfirmationViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        content
            .onChange(of: viewModel.orderResponse) { _, _ in
                coordinator.pushSuccess()
            }
            .alert(item: $viewModel.orderError) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }
    }

    private var content: some View {
        ZStack {
            VStack {
                ScrollView() {
                    Text("Vásárlás megerősítése")
                        .foregroundStyle(Color.Yettel.primaryBlue)
                    ScrollView {
                        VStack(spacing: 10) {
                            Divider()
                            ConfirmationViewTopRow(
                                leadingText: "Rendszám",
                                trailingText: viewModel.vignetteInformation.vehicleData.vehiclePlateNumber.uppercased())
                            ConfirmationViewTopRow(
                                leadingText: "Matrica típusa",
                                trailingText: viewModel.getSelectedVignetteTypeName())
                            Divider()
                            ForEach(viewModel.getSelectedVignetteTypes(), id: \.self) { vignetteType in
                                ConfirmationViewItemRow(
                                    leadingText: viewModel.getVignetteItemName(for: vignetteType.vignetteType),
                                    trailingText: viewModel.getVignetteItemBasePriceText(for: vignetteType.vignetteType))
                            }
                            ConfirmationViewTopRow(
                                leadingText: "Rendszerhasználati díj",
                                trailingText: viewModel.getTransactionFeeText())
                            Divider()
                            PaymentTotalView(totalPriceText: viewModel.getTotalPriceText())
                        }
                    }
                }
                RoundedButton(style: .primary, content: {
                    Text("Tovább")
                }) {
                    Task{
                        await viewModel.confirmPurchase()
                    }
                }
                RoundedButton(style: .secondary, content: {
                    Text("Mégsem")
                }) {
                    coordinator.reset()
                }
            }
            .padding()
            .frame(alignment: .leading)
            .frame(maxWidth: .infinity)

            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

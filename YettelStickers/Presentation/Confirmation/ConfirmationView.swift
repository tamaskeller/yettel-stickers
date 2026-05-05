import SwiftUI

struct ConfirmationView: View {

    @StateObject var viewModel: ConfirmationViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        content
    }

    private var content: some View {
        VStack {
            ScrollView() {
                Text("Vásárlás megerősítése")
                ScrollView {
                    VStack {
                        Divider()
                        ConfirmationViewTopRow(
                            leadingText: "Rendszám",
                            trailingText: viewModel.vignetteInformation.vehicleData.vehiclePlateNumber)
                        ConfirmationViewTopRow(
                            leadingText: "Matrica típusa",
                            trailingText: "Típus xy")
                        Divider()

                    }
                }
            }
            RoundedButton(style: .primary, content: {
                Text("Tovább")
            }) {
                coordinator.pushSuccess()
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
    }
}

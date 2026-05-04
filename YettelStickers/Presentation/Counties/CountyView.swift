import SwiftUI

struct CountyView: View {

    @StateObject var viewModel: CountyViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        content
    }

    private var content: some View {
        VStack {
            ScrollView() {
                Text("Éves vármegyei matricák")
                VStack {
                    Assets.Images.countyGroupPreset.renderingMode(.original)
                    let counties = viewModel.currentState.payload.counties
                    ForEach(counties, id: \.self) { county in
                        let isSelected = viewModel.selectedCounties.contains(county)
                        let price = viewModel.getCountyVignettePrice(for: county)
                        CountyListTileView(title: county.name, price: "\(Int(price)) Ft", isSelected: isSelected)
                            .onTapGesture {
                                viewModel.toggle(county)
                            }
                    }
                }
            }

            RoundedButton(content: {
                Text("Vásárlás")
            }) {
                coordinator.pushConfirmation(
                    selection: viewModel.getCurrentOrder(),
                    response: viewModel.currentState)
            }
        }
        .padding()
        .frame(alignment: .leading)
        .frame(maxWidth: .infinity)
    }
}

import SwiftUI

struct ConfirmationView: View {

    @StateObject var viewModel: ConfirmationViewModel

    var body: some View {
        content
    }

    private var content: some View {
        VStack {
            ScrollView() {
                Text("Éves vármegyei matricák")
                VStack {
                    Assets.Images.countyGroupPreset.renderingMode(.original)
//                    ForEach(viewModel.counties, id: \.self) { county in
//                        let isSelected = viewModel.selectedCounties.contains(county)
//                        CountyListTileView(title: county.name, price: "666", isSelected: isSelected)
//                            .onTapGesture {
//                                viewModel.toggle(county)
//                            }
//                    }
                }
            }

            RoundedButton(content: {
                Text("Vásárlás")
            }) {
                print("MEGVESZEM")
            }
        }
        .padding()
        .frame(alignment: .leading)
        .frame(maxWidth: .infinity)
    }
}

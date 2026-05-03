import SwiftUI

struct CountryWideVignettesListView: View {

    let vignettes: [VignetteInformationHighwayVignette]
    let purchaseAction: () -> Void

    @Binding var selectedVignette: VignetteInformationHighwayVignette?

    var body: some View {
        RoundedCardView {
            VStack(alignment: .leading) {
                Text("Országos matricák")
                ForEach(0..<vignettes.count, id: \.self) { i in
                    let isSelected = selectedVignette?.vignetteType == vignettes[i].vignetteType
                    CountryWideTicketView(
                        title: vignettes[i].vignetteType.first ?? "",
                        price: "\(Int(vignettes[i].sum)) Ft")
                    .roundedCorners(
                            radius: 8,
                            strokeColor: isSelected ?
                            Assets.Colors.primaryBlue ?? .clear :
                                Assets.Colors.backgroundGrey ?? .clear)
                    .onTapGesture {
                        selectedVignette = vignettes[i]
                    }
                }
                RoundedButton(content: {
                    Text("Vásárlás")
                        .frame(maxWidth: .infinity)
                }, action: {
                    purchaseAction()
                })
            }
            .background(Color.white)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CountryWideVignettesListView(vignettes: [], purchaseAction: {}, selectedVignette: .constant(nil))
}

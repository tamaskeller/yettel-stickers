import SwiftUI

struct CountryWideVignettesListView: View {

    let vignettes: [VignettePresentationVignetteData]
    let purchaseAction: () -> Void

    @Binding var selectedVignetteIdentifier: String?

    var body: some View {
        RoundedCardView {
            VStack(alignment: .leading) {
                ForEach(0..<vignettes.count, id: \.self) { i in
                    vignetteView(for: vignettes[i])
                    .onTapGesture {
                        selectedVignetteIdentifier = vignettes[i].vignetteType
                    }
                }
                bottomButton
            }
            .background(Color.white)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func vignetteView(for vignette: VignettePresentationVignetteData) -> some View {
        let isSelected = selectedVignetteIdentifier == vignette.vignetteType
        return CountryWideTicketView(
            title: VignetteTypeName(rawValue: vignette.vignetteType)?.displayName ?? "",
            price: "\(Int(vignette.sum)) Ft")
        .roundedCorners(
            radius: 8,
            strokeColor: isSelected ? .Yettel.primaryBlue : .Yettel.backgroundGrey)
    }

    private var bottomButton: some View {
        RoundedButton(content: {
            Texts.Global.buttonPurchase
        }, action: {
            purchaseAction()
        })
    }
}

#Preview {
    CountryWideVignettesListView(vignettes: [], purchaseAction: {}, selectedVignetteIdentifier: .constant(nil))
}

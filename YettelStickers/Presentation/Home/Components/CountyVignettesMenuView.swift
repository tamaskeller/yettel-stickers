import SwiftUI

struct CountyVignettesMenuView: View {

    let purchaseAction: () -> Void

    var body: some View {
        Button {
            purchaseAction()
        } label: {
            RoundedCardView {
                HStack {
                    Text("Matricák")
                        .foregroundColor(.Yettel.primaryBlue)
                    Spacer()
                    Assets.Images.chevronRight
                }
            }
        }
    }
}

#Preview {
    CountyVignettesMenuView(purchaseAction: {})
}

import SwiftUI

struct PaymentTotalView: View {

    let totalPriceText: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Texts.Global.totalPrice
                Text(totalPriceText)
            }
            Spacer()
        }
    }
}

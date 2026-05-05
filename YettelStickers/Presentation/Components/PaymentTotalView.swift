import SwiftUI

struct PaymentTotalView: View {

    let totalPriceText: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Fizetendő összeg")
                Text(totalPriceText)
            }
            Spacer()
        }
    }
}

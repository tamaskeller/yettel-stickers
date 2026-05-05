import SwiftUI

struct ConfirmationViewItemRow: View {

    let leadingText: String
    let trailingText: String

    var body: some View {
        HStack {
            Text(leadingText)
                .font(.system(size: 16, weight: .bold))
            Spacer()
            Text(trailingText)
        }
        .foregroundStyle(Color.Yettel.primaryBlue)
    }
}

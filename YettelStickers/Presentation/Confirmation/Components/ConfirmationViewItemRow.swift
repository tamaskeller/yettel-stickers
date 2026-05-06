import SwiftUI

struct ConfirmationViewItemRow: View {

    let leadingText: String
    let trailingText: String

    var body: some View {
        HStack {
            Text(leadingText)
                .font(.Yettel.bold(size: 16))
            Spacer()
            Text(trailingText)
        }
        .foregroundStyle(Color.Yettel.primaryBlue)
    }
}

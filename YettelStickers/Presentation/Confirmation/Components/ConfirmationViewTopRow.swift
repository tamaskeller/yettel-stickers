import SwiftUI

struct ConfirmationViewTopRow: View {

    let leadingText: String
    let trailingText: String

    var body: some View {
        HStack {
            Text(leadingText)
            Spacer()
            Text(trailingText)
        }
        .foregroundStyle(Color.Yettel.primaryBlue)
    }
}

import SwiftUI

struct ConfirmationViewItemRow: View {

    let leadingText: String
    let trailingText: String

    var body: some View {
        Text(leadingText)
        Spacer()
        Text(trailingText)
    }
}

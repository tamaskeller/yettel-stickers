import SwiftUI

struct CountryWideTicketView: View {

    private let title: String
    private let price: String

    init(title: String, price: String) {
        self.title = title
        self.price = price
    }

    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.Yettel.primaryBlue)
            Spacer()
            Text(price)
                .foregroundColor(.Yettel.primaryBlue)
        }
        .padding()
        .contentShape(Rectangle())
    }
}

#Preview {
    CountryWideTicketView(title: "ITT KELL VENNI", price: "Some price")
        .padding()
}

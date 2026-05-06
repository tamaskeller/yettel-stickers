import SwiftUI

struct CountyListTileView: View {

    private let title: String
    private let price: String
    private let isSelected: Bool

    init(title: String, price: String, isSelected: Bool = false) {
        self.title = title
        self.price = price
        self.isSelected = isSelected
    }

    var body: some View {
        HStack{
            let image = isSelected ? Images.checkboxFilled : Images.checkboxEmpty
            image
                .padding(.trailing, 12)
            Text(title)
                .foregroundColor(isSelected ? .Yettel.textGrey : .Yettel.primaryBlue)
            Spacer()
            Text(price)
                .foregroundColor(.Yettel.primaryBlue)
        }
        .padding()
        .frame(height: 24)
        .contentShape(Rectangle())
    }
}

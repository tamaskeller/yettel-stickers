//
//  CountyListTileView.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 05. 03..
//

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
            let image = isSelected ? Assets.Images.checkboxFilled : Assets.Images.checkboxEmpty
            image
                .padding(.trailing, 12)
            Text(title)
                .foregroundColor(isSelected ? Assets.Colors.textGrey : Assets.Colors.primaryBlue)
            Spacer()
            Text(price)
                .foregroundColor(Assets.Colors.primaryBlue)
        }
        .padding()
        .contentShape(Rectangle())
    }
}

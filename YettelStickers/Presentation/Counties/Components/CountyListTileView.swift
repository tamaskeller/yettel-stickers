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
            Text(title)
                .foregroundColor(Assets.Colors.primaryBlue)
            Spacer()
            Text(price)
                .foregroundColor(Assets.Colors.primaryBlue)
        }
        .padding()
        .background(isSelected ? Color.yellow : Color.clear)
        .contentShape(Rectangle())
    }
}

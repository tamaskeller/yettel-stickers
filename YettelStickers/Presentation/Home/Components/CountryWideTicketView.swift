//
//  CountryWideTicketView.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 04. 29..
//


import SwiftUI

struct CountryWideTicketView: View {

    private let title: String
    private let price: String
    private let action: () -> Void

    init(title: String, price: String, action: @escaping () -> Void) {
        self.title = title
        self.price = price
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack{
                Text(title)
                    .foregroundColor(Assets.Colors.primaryBlue)
                Spacer()
                Text(price)
                    .foregroundColor(Assets.Colors.primaryBlue)
            }
            .padding()
        }

    }
}

#Preview {
    CountryWideTicketView(title: "ITT KELL VENNI", price: "Some price") {}
        .padding()
}

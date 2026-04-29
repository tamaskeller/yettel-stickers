//
//  CountryWideVignettesView.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 04. 29..
//

import SwiftUI

struct CountryWideVignettesListView: View {

    let purchaseAction: () -> Void

    var body: some View {
        RoundedCardView {
            VStack(alignment: .leading) {
                Text("Országos matricák")
                RoundedButton(content: {
                    Text("Vásárlás")
                }, action: {
                    purchaseAction()
                })
            }
            .background(Color.white)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CountryWideVignettesListView(purchaseAction: {})
}

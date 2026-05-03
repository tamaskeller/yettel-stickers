//
//  CountyVignettesMenuView.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 04. 29..
//

import SwiftUI

struct CountyVignettesMenuView: View {

    let purchaseAction: () -> Void

    var body: some View {
        Button {
            purchaseAction()
        } label: {
            RoundedCardView {
                HStack {
                    Text("Matricák")
                        .foregroundColor(Assets.Colors.primaryBlue)
                    Spacer()
                    Assets.Images.chevronRight
                }
            }
        }
    }
}

#Preview {
    CountyVignettesMenuView(purchaseAction: {})
}

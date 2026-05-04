//
//  VehicleCardView.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 04. 29..
//

import SwiftUI

struct VehicleCardView: View {
    private let licensePlateNumber: String
    private let ownerName: String

    init(licensePlateNumber: String, ownerName: String) {
        self.licensePlateNumber = licensePlateNumber
        self.ownerName = ownerName
    }

    var body: some View {
        RoundedCardView {
            HStack {
                Assets.Images.iconCar.padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text("\(licensePlateNumber.uppercased())")
                        .font(.caption)
                        .foregroundColor(.Yettel.primaryBlue)
                    Text("\(ownerName)")
                        .font(.caption)
                        .foregroundColor(.Yettel.primaryBlue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    VehicleCardView(licensePlateNumber: "ABC-123", ownerName: "Máresi Kiskin")
}

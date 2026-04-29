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
                Image(systemName: "globe")
                VStack(alignment: .leading) {
                    Text("\(licensePlateNumber)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(ownerName)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    VehicleCardView(licensePlateNumber: "ABC-123", ownerName: "Máresi Kiskin")
}

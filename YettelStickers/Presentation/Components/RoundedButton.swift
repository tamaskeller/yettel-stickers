//
//  RoundedButton.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 04. 29..
//

import SwiftUI

struct RoundedButton<Content: View>: View {
    private let content: Content
    private let action: () -> Void

    init(@ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.content = content()
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }) {
            content
        }
        .padding(.horizontal)
        .foregroundStyle(.white)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(Styles.Colors.primaryBlue)
        .cornerRadius(24)
    }
}

#Preview {
    RoundedButton(content: {
        Text("ASDASD")
    }) {}
}

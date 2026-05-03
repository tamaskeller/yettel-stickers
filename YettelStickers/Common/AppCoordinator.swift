//
//  AppCoordinator.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 05. 03..
//

import SwiftUI

@MainActor
class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func goToCounties(counties: [VignetteInformationCounty]) {
        path.append(AppRoute.counties(counties))
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }
}

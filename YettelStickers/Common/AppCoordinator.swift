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

    func pushCounties(counties: [VignetteInformationCounty]) {
        path.append(AppRoute.counties(counties))
    }

    func pushConfirmation(perorders: [HighwayTicketPreorder]) {
        path.append(AppRoute.confirmation(perorders))
    }

    func goBack() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }
}

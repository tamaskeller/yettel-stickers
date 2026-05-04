//
//  AppRoute.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 05. 03..
//

enum AppRoute: Codable, Hashable {
    case home
    case counties(vignetteInfo: VignetteInformationResponse)
    case confirmation(selectionIdentifiers: Set<String>, vignetteInfo: VignetteInformationResponse)
}

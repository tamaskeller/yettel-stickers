//
//  AppRoute.swift
//  YettelStickers
//
//  Created by Tamás Keller on 2026. 05. 03..
//

enum AppRoute: Codable, Hashable {
    case home
    case counties([VignetteInformationCounty])
    case confirmation([HighwayTicketPreorder])
}

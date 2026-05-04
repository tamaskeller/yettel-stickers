enum AppRoute: Codable, Hashable {
    case home
    case counties(vignetteInfo: VignetteInformationResponse)
    case confirmation(selectionIdentifiers: Set<String>, vignetteInfo: VignetteInformationResponse)
}

enum AppRoute: Hashable {
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool { return false}

    case home
    case counties(vignetteInfo: VignettePresentationData)
    case confirmation(selectionIdentifiers: Set<String>, vignetteInfo: VignettePresentationData)
}

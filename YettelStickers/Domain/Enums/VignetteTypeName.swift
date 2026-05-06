enum VignetteTypeName: String {
    case day = "DAY"
    case week = "WEEK"
    case month = "MONTH"
    case year = "YEAR"
    case county = ""

    var displayName: String {
        switch self {
        case .day:
            return Texts.Raw.vignetteDay
        case .week:
            return Texts.Raw.vignetteWeek
        case .month:
            return Texts.Raw.vignetteMonth
        case .year:
            return Texts.Raw.vignetteYear
        case .county:
            return Texts.Raw.vignetteCounty
        }
    }
}

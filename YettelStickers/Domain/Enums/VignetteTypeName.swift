enum VignetteTypeName: String {
    case day = "DAY"
    case week = "WEEK"
    case month = "MONTH"
    case year = "YEAR"
    case county = ""

    var displayName: String {
        switch self {
        case .day:
            return "Országos napi"
        case .week:
            return "Országos heti"
        case .month:
            return "Országos havi"
        case .year:
            return "Országos évi"
        case .county:
            return "Éves vármegyei"
        }
    }
}

struct HighwayTicketPreorder: Codable, Equatable, Hashable {
    let ticketIdenfitiers: [String]
    let vehicleIdentifier: String
    let priceBase: Int
    let priceIncrease: Int
    let priceTotal: Int
}

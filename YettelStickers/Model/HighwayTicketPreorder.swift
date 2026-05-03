struct HighwayTicketPreorder: Codable {
    let ticketIdenfitiers: String
    let vehicleIdentifier: String
    let priceBase: Int
    let priceIncrease: Int
    let priceTotal: Int
}

public struct VignettePresentationVignetteData: Codable, Hashable {
    public var vignetteType: String
    public var vehicleCategory: String
    public var cost: Float
    public var trxFee: Float
    public var sum: Float
    public var isSingular: Bool

    public init(vignetteType: String, vehicleCategory: String, cost: Float, trxFee: Float, sum: Float, isSingular: Bool) {
        self.vignetteType = vignetteType
        self.vehicleCategory = vehicleCategory
        self.cost = cost
        self.trxFee = trxFee
        self.sum = sum
        self.isSingular = isSingular
    }
}

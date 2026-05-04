struct VignettePresentationVignetteData: Codable, Hashable {
    public var vignetteType: String
    public var cost: Float
    public var trxFee: Float
    public var sum: Float
    public var isSingular: Bool
}

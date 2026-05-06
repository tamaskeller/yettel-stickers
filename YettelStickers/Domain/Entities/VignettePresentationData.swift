public struct VignettePresentationData: Hashable {
    public static func == (lhs: VignettePresentationData, rhs: VignettePresentationData) -> Bool { return false}

    let counties: [VignettePresentationCountyData]
    let vehicleData: VignettePresentationVehicleData
    let vignetteData: [String: VignettePresentationVignetteData]

    public init(
        counties: [VignettePresentationCountyData],
        vehicleData: VignettePresentationVehicleData,
        vignetteData: [String: VignettePresentationVignetteData]
    ) {
        self.counties = counties
        self.vehicleData = vehicleData
        self.vignetteData = vignetteData
    }
}

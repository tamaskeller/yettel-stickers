struct VignettePresentationData: Hashable {
    static func == (lhs: VignettePresentationData, rhs: VignettePresentationData) -> Bool { return false}

    let counties: [VignettePresentationCountyData]
    let vehicleData: VignettePresentationVehicleData
    let vignetteData: [String: VignettePresentationVignetteData]
}

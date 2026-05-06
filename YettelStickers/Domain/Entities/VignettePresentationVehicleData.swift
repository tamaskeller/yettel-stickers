public struct VignettePresentationVehicleData: Codable, Hashable {
    let vehicleOwnerName: String
    let vehiclePlateNumber: String

    public init(
        vehicleOwnerName: String,
        vehiclePlateNumber: String
    ) {
        self.vehicleOwnerName = vehicleOwnerName
        self.vehiclePlateNumber = vehiclePlateNumber
    }
}

import Foundation

public struct ErrorWrapper: Identifiable {
    public let id = UUID()
    public let message: String
}

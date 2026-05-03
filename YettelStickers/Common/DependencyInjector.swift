import Swinject

public final class DependencyInjector {
    private let container = Container()

    public static let shared = DependencyInjector()

    public func resolve<T>(_ type: T.Type) -> T {
        guard let resolved = container.resolve(type) else {
            fatalError("Failed to resolve type \(type)")
        }
        return resolved
    }

    public func resolve<T, Arg>(_ type: T.Type, argument: Arg) -> T {
        guard let resolved = container.resolve(type, argument: argument) else {
            fatalError("Failed to resolve type \(type)")
        }
        return resolved
    }

    private init() {
        registerServices()
        registerRepositories()
        registerViewModels()
    }

    private func registerServices() {
        container.register(HighwayNetworkServiceProtocol.self) { _ in
            HighwayNetworkService()
        }.inObjectScope(.container)
    }

    private func registerRepositories() {
        container.register(HighwayRepositoryProtocol.self) { [unowned self] _ in
            HighwayRepository(networkService: resolve(HighwayNetworkServiceProtocol.self))
        }.inObjectScope(.container)
    }

    private func registerViewModels() {
        container.register((any HomeViewModelProtocol).self) { [unowned self] _ in
            HomeViewModel(
                repository: resolve(HighwayRepositoryProtocol.self))
        }
        container.register((any CountyViewModelProtocol).self) { [unowned self] (_, counties: [VignetteInformationCounty]) in
            CountyViewModel(
                counties: counties,
                repository: resolve(HighwayRepositoryProtocol.self))
        }
        container.register((any ConfirmationViewModelProtocol).self) { [unowned self] (_, preorder: [HighwayTicketPreorder]) in
            ConfirmationViewModel(
                preorderData: preorder,
                repository: resolve(HighwayRepositoryProtocol.self))
        }
    }
}


import Swinject

public final class DependencyInjector {
    private let container = Container()

    public static let shared = DependencyInjector()

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
        container.register((any HomeViewModelProtocol).self) {
            [unowned self] _ in
            HomeViewModel(repository: resolve(HighwayRepositoryProtocol.self))
        }
        container.register((any CountyViewModelProtocol).self) {
            [unowned self] (_, currentState) in
            CountyViewModel(currentState: currentState,
                            repository: resolve(HighwayRepositoryProtocol.self))
        }
        container.register((any ConfirmationViewModelProtocol).self) {
            [unowned self] (_, selections, vignettes) in
            ConfirmationViewModel(selectionIdentifiers: selections,
                                  vignetteInformation: vignettes,
                                  repository: resolve(HighwayRepositoryProtocol.self))
        }
    }
}

extension DependencyInjector {
    public func resolve<T>(_ type: T.Type) -> T {
        guard let resolved = container.resolve(type) else {
            fatalError("Failed to resolve type \(type)")
        }
        return resolved
    }

    public func resolve<T, Arg1>(_ type: T.Type, _ argument: Arg1) -> T {
        guard let resolved = container.resolve(type, argument: argument) else {
            fatalError("Failed to resolve type \(type)")
        }
        return resolved
    }

    public func resolve<T, Arg1, Arg2>(_ type: T.Type, _ argument1: Arg1, _ argument2: Arg2) -> T {
        guard let resolved = container.resolve(type, arguments: argument1, argument2) else {
            fatalError("Failed to resolve type \(type)")
        }
        return resolved
    }
}


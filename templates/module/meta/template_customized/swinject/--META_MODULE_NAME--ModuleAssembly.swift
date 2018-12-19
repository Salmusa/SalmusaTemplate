--INCLUDE:FileHeader--

import Foundation
import Swinject

final class --META_MODULE_NAME--ModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(--META_MODULE_NAME--Interactor.self) { _ in .init() }
        container.register(--META_MODULE_NAME--Presenter.self) { _ in .init() }
        container.register(--META_MODULE_NAME--Router.self) { _ in .init() }
        container.register(--META_MODULE_NAME--View.self) { _ in .init() }
        container.register(--META_MODULE_NAME--Module.self) { resolver in
            .init(
                interactor: resolver.resolve(--META_MODULE_NAME--Interactor.self)!,
                presenter: resolver.resolve(--META_MODULE_NAME--Presenter.self)!,
                router: resolver.resolve(--META_MODULE_NAME--Router.self)!,
                view: resolver.resolve(--META_MODULE_NAME--View.self)!
            )
        }
    }
}

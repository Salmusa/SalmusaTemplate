final class --META_MODULE_NAME--Module {

    var input: --META_MODULE_NAME--ModuleInput {
        return presenter.input
    }
    var output: --META_MODULE_NAME--ModuleOutput? {
        get { return presenter.output }
        set { presenter.output = newValue }
    }
    let router: --META_MODULE_NAME--RouterInput

    private let interactor: --META_MODULE_NAME--Interactor
    private let presenter: --META_MODULE_NAME--Presenter
    private let _router: --META_MODULE_NAME--Router
    private let view: --META_MODULE_NAME--View

    init(interactor: --META_MODULE_NAME--Interactor,
         presenter: --META_MODULE_NAME--Presenter,
         router: --META_MODULE_NAME--Router,
         view: --META_MODULE_NAME--View) {
        self.interactor = .init()
        self.presenter = .init()
        self._router = .init()
        self.view = .init()
        self.router = _router
        connectComponents()
    }

    private func connectComponents() {
        interactor.output = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        _router.view = view

        view.output = presenter
    }
}
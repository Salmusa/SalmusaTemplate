final class --META_MODULE_NAME--Module: Module<--META_MODULE_NAME--Interactor, --META_MODULE_NAME--Presenter, --META_MODULE_NAME--Router, --META_MODULE_NAME--View> {

    convenience init() {
        self.init(
            interactor: .init(),
            presenter: .init(),
            router: .init(),
            view: .init()
        )
    }
}
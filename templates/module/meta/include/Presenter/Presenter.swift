final class --META_MODULE_NAME--Presenter--META_PRESENTER_PROTOCOL-- {

    var input: --META_MODULE_NAME--ModuleInput { return self }
    weak var output: --META_MODULE_NAME--ModuleOutput?

    var interactor: --META_MODULE_NAME--InteractorInput!
    var router: --META_MODULE_NAME--RouterInput!
    weak var view: --META_MODULE_NAME--ViewInput!
}

// MARK: - --META_MODULE_NAME--ModuleInput
extension --META_MODULE_NAME--Presenter: --META_MODULE_NAME--ModuleInput {
}

// MARK: - --META_MODULE_NAME--InteractorOutput
extension --META_MODULE_NAME--Presenter: --META_MODULE_NAME--InteractorOutput {
}

// MARK: - --META_MODULE_NAME--ViewOutput
extension --META_MODULE_NAME--Presenter: --META_MODULE_NAME--ViewOutput {
}
--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

// sourcery: AutoMockable
extension --META_MODULE_NAME--ModuleOutput {}
// sourcery: AutoMockable
extension --META_MODULE_NAME--InteractorInput {}
// sourcery: AutoMockable
extension --META_MODULE_NAME--RouterInput {}
// sourcery: AutoMockable
extension --META_MODULE_NAME--ViewInput {}

final class --META_MODULE_NAME--PresenterTests: XCTestCase {

    private var presenter: --META_MODULE_NAME--Presenter!
    private var output: --META_MODULE_NAME--ModuleOutputMock!
    private var interactor: --META_MODULE_NAME--InteractorInputMock!
    private var router: --META_MODULE_NAME--RouterInputMock!
    private var view: --META_MODULE_NAME--ViewInputMock!

    override func setUp() {
        super.setUp()
        presenter = --META_MODULE_NAME--Presenter()
        output = --META_MODULE_NAME--ModuleOutputMock()
        interactor = --META_MODULE_NAME--InteractorInputMock()
        router = --META_MODULE_NAME--RouterInputMock()
        view = --META_MODULE_NAME--ViewInputMock()
        presenter.output = output
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }
}

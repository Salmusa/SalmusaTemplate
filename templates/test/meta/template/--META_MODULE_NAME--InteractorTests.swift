--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

// sourcery: AutoMockable
extension --META_MODULE_NAME--InteractorOutput {}

final class --META_MODULE_NAME--InteractorTests: XCTestCase {

    private var interactor: --META_MODULE_NAME--Interactor!
    private var interactorOutput: --META_MODULE_NAME--InteractorOutput!

    override func setUp() {
        super.setUp()
        interactor = --META_MODULE_NAME--Interactor()
        interactorOutput = --META_MODULE_NAME--InteractorOutputMock()
        interactor.output = interactorOutput
    }
}

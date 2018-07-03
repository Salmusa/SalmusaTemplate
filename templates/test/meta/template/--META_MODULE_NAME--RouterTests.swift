--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

final class --META_MODULE_NAME--RouterTests: XCTestCase {

    private var router: --META_MODULE_NAME--Router!
    private var view: --META_MODULE_NAME--View!

    private final class --META_MODULE_NAME--ViewMock: --META_MODULE_NAME--View {
    }

    override func setUp() {
        super.setUp()
        router = --META_MODULE_NAME--Router()
        view = --META_MODULE_NAME--ViewMock()
        router.view = view
    }
}
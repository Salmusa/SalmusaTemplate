--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

// sourcery: AutoMockable
extension --META_MODULE_NAME--ViewOutput {}

final class --META_MODULE_NAME--ViewTests: XCTestCase {

    private var view: --META_MODULE_NAME--View!
    private var viewOutput: --META_MODULE_NAME--ViewOutput!

    override func setUp() {
        super.setUp()
        view = --META_MODULE_NAME--View()
        viewOutput = --META_MODULE_NAME--ViewOutputMock()
        view.output = viewOutput
    }
}

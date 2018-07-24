--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

final class --META_MODULE_NAME--ModuleTests: XCTestCase {

    func testInitializeModule() {
        let module = --META_MODULE_NAME--Module()
        XCTAssertTrue(module.input is --META_MODULE_NAME--Presenter)
        XCTAssertTrue(module.router is --META_MODULE_NAME--Router)
    }
}

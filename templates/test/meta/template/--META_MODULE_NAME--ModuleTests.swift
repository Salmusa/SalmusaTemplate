--INCLUDE:FileHeader--

import XCTest
@testable import --META_HOST_TARGET_NAME--

final class --META_MODULE_NAME--ModuleTests: XCTestCase {

    func testInitializeModule() {
        XCTAssertNoThrow(--META_MODULE_NAME--Module())
    }
}

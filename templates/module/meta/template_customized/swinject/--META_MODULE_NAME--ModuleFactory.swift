--INCLUDE:FileHeader--

import Foundation
import Swinject

final class --META_MODULE_NAME--ModuleFactory {

    static func create() -> --META_MODULE_NAME--Module {
        let assembler = Assembler()
        assembler.apply(assembly: --META_MODULE_NAME--ModuleAssembly())
        return assembler.resolver.resolve(--META_MODULE_NAME--Module.self)!
    }
}

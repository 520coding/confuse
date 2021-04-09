//
//  SwiftBase.swift
//  confuse_test
//
//  Created by yjs on 2021/2/19.
//  Copyright © 2021 coding520. All rights reserved.
//

import Foundation

extension Bundle {
    var module: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}

protocol SwiftBaseProtocol {
    func test()
}

class SwiftBase: SwiftBaseProtocol {
    func test() {
    }
}

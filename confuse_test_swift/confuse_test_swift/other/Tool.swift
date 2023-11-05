//
//  Tool.swift
//  confuse_test_swift
//
//  Created by yjs on 2023/11/4.
//

import Foundation

enum AnchorStaus {
    case online
    case busy

    static func fromeString(_ statusString: String) -> AnchorStaus {
        switch statusString.lowercased() {
        case "online":
            return .online
        case "busy":
            return .busy
        default:
            return .online
        }
    }
}

extension TimeInterval {
    var formate: String {
        return "HHMMSS"
    }
}

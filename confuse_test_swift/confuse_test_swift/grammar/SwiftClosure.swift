//
//  SwiftClosure.swift
//  confuse_test
//
//  Created by yjs on 2022/7/22.
//  Copyright © 2022 coding520. All rights reserved.
//

import UIKit

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

class Server {
    var currentPicture = ""
}

struct Picture {
    var name = ""
}


private func download(_ picture:String, from:Server) -> Picture? {
    return Picture(name: picture + from.currentPicture)
}

func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

class SwiftClosure: BaseViewController, SwiftBaseProtocol {
    override func viewDidAppear(_ animated: Bool) {
        test()
    }

    func test() {
        someFunctionThatTakesAClosure(closure: {
            // closure's body goes here
        })

        // Here's how you call this function with a trailing closure instead:

        someFunctionThatTakesAClosure() {
            // trailing closure's body goes here
        }
        let someServer = Server()
        loadPicture(from: someServer) { picture in
            self.title = picture.name
        } onFailure: {
            print("Couldn't download the next picture.")
        }
    }
}


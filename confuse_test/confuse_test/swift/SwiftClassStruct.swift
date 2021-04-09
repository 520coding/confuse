//
//  SwiftClassStruct.swift
//  confuse_test
//
//  Created by yjs on 2021/4/5.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    required init() {
        
    }
}

typealias mode = VideoMode

class SwiftClassStruct: UIViewController, SwiftBaseProtocol {
    var tableView = UITableView.init()
    override func viewDidAppear(_ animated: Bool) {
        test()
    }

    func test() {
        print("mode: %@", mode.self);
        print(NSStringFromClass(VideoMode.self))
        NSClassFromString("VideoMode")
        Bundle.main.loadNibNamed("VideoMode", owner: self, options: nil)
        _ = UINib.init(nibName: "VideoMode", bundle: nil)
        print("VideoMode")
        print("ContainVideoMode")
        print("ContainVideoModeContainVideoMode")
        tableView.register(UINib.init(nibName: "VideoMode", bundle: nil), forCellReuseIdentifier: NSStringFromClass(mode.self))
        tableView.register(UINib.init(nibName: "VideoMode", bundle: nil), forCellReuseIdentifier: "VideoMode")
        tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(mode.self))
        tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(mode.self), for: IndexPath.init(row: 0, section: 1))
        
        let someResolution = Resolution()
        print("The width of someResolution is \(someResolution.width)")
        // print "The width of someResolution is 0"
        print(NSStringFromClass(VideoMode.self))
        let cls: AnyClass? = NSClassFromString(Bundle.main.module + "." + "VideoMode")
    
        guard let clsType = cls as? VideoMode.Type else {
            print("error to Resolution")
            return
        }
        let someVideoMode = clsType.init()

        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // print "The width of someVideoMode is 0"
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // print "The width of someVideoMode is now 1280"
        _ = Resolution(width: 640, height: 480)
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema is now  \(cinema.width) pixels wide")
        // print "cinema is now 2048 pixels wide"
        print("hd is still \(hd.width) pixels wide")
        // print "hd is still 1920 pixels wide"

        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // print "The frameRate property of theEighty is now 30.0"
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        // print "tenEighty and alsoTenEighty refer to the same VideoMode instance."
    }
}

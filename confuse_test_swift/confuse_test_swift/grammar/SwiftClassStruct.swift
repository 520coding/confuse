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

class SwiftClassStruct: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        let value = randomInRange(5 ..< 10)
        print("randomInRange: %d", value)
        if value == 1 {
            tableView.register(UINib(nibName: "VideoMode", bundle: nil), forCellReuseIdentifier: NSStringFromClass(mode.self))
        } else if value == 2 {
            tableView.register(UINib(nibName: "VideoMode", bundle: nil), forCellReuseIdentifier: "VideoMode")
        } else if value == 3 {
            tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(mode.self))
        } else if value == 4 {
            tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(mode.self), for: IndexPath(row: 0, section: 1))
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        print("mode: %@", mode.self)
        print(NSStringFromClass(VideoMode.self))
        NSClassFromString("VideoMode")
        if title == "VideoMode" {
            Bundle.main.loadNibNamed("VideoMode", owner: self, options: nil)
            _ = UINib(nibName: "VideoMode", bundle: nil)
            print("VideoMode")
            print("ContainVideoMode")
            print("ContainVideoModeContainVideoMode")
        }

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

    func randomInRange(_ range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return Int(arc4random_uniform(count)) + range.startIndex
    }
}

extension SwiftClassStruct: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(NSStringFromClass(mode.self))
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(mode.self), for: indexPath)
        return cell
    }
}

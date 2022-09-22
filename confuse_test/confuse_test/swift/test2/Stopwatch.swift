//
//  Stopwatch.swift
//  Stopwatch
//
//  Copyright © 2016 YiGu. All rights reserved.
//

import Foundation
import UIKit

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    var views: [UIView]

    override init() {
        counter = 0.0
        timer = Timer()
        views = [UIView()]
    }

    func getView1(v name: UIView) -> UIView? {
        if name.isHidden {
            return UILabel()
        }
        if name.canBecomeFocused {
            return views.last { v in
                return v.isHidden
            }
        }
        return name
    }

    func getView2(v name: UIView) -> UIView? {
        return name
    }
    
    class func getView3(v name: UIView) -> UIView? {
        return name
    }
    
    static func getView4(v name: UIView) -> UIView? {
        return name
    }
}


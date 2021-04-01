//
//  SwiftFunction.swift
//  confuse_test
//
//  Created by yjs on 2021/2/9.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class Counter {
    var count = 0
    func increment() {
        count += 1
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

struct FuncPoint {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }

    mutating func moveBy2(x deltaX: Double, y deltaY: Double) {
        self = FuncPoint(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        playerName = name
    }
}

class SwiftFunction: UIViewController, SwiftBaseProtocol {
    override func viewWillAppear(_ animated: Bool) {
        test()
    }

    @IBAction func touchDown(_ sender: Any) {
        print(sender)
    }

    @IBAction func clickOutside(_ sender: Any) {
        print(sender)
    }

    @IBAction func click(_ sender: Any) {
        print(sender)
    }

    func test() {
        let counter = Counter()
        // the initial counter value is 0
        counter.increment()
        // the counter's value is now 2
        counter.increment(by: 5)
        counter.reset()
        // the counter's value is now 0

        let somePoint = FuncPoint(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        // Prints "This point is to the right of the line where x == 1.0"

        var somePoint2 = FuncPoint(x: 1.0, y: 1.0)
        somePoint2.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
        // Prints "The point is now at (3.0, 4.0)"

        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        // ovenLight .high
        ovenLight.next()
        // ovenLight .off

        var player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // Prints "highest unlocked level is now 2"

        player = Player(name: "Beto")
        if player.tracker.advance(to: 6) {
            print("player is now on level 6")
        } else {
            print("level 6 hasn't yet been unlocked")
        }
        // Prints "level 6 hasn't yet been unlocked"
    }
}

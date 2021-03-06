//
//  SwiftProtocol.swift
//  confuse_test
//
//  Created by yjs on 2021/2/19.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    static func someTypeMethod()
    init(someParameter: Int)
}

class SomeSuperClass {
    init() {
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    var mustBeSettable: Int

    var doesNotNeedToBeSettable: Int

    static func someTypeMethod() {
    }

    required convenience init(someParameter: Int) {
        self.init()
    }

    override required init() {
        mustBeSettable = 1
        doesNotNeedToBeSettable = 2
        super.init()
    }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }

    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

class SwiftProtocol: UIViewController, SwiftBaseProtocol {
    override func viewWillAppear(_ animated: Bool) {
        test()
    }

    func test() {
        let john = Person(fullName: "John Appleseed")
        print(john)

        let ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        print(ncc1701)

        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        print("And another one: \(generator.random())")

        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()

        let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1 ... 5 {
            print("Random dice roll is \(d6.roll())")
        }
        // Random dice roll is 3
        // Random dice roll is 5
        // Random dice roll is 4
        // Random dice roll is 5
        // Random dice roll is 4
    }
}

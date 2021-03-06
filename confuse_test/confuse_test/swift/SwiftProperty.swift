//
//  SwiftProperty.swift
//  confuse_test
//
//  Created by yjs on 2021/2/19.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class DataImporter {
    var name: String?
    static var age: Int?
    class var currentAge: Int? {
        return age
    }

    var fileName = "data.txt"
}

class SubDataImporter: DataImporter {
    override var name: String? {
        get { return "YJS" }
        set { super.name = "YJS" }
    }
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }

    var center1: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("newTotalSteps: \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("add: \(totalSteps - oldValue) step")
            }
        }
    }
}

@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() { number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }

    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

@propertyWrapper
struct SmallNumber1 {
    private var number: Int
    var projectedValue: Bool
    init() {
        number = 0
        projectedValue = false
    }

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct SomeStructure {
    @SmallNumber1 var someNumber: Int
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum Size1 {
    case small, large
}

struct SizedRectangle {
    @SmallNumber1 var height: Int
    @SmallNumber1 var width: Int

    mutating func resize(to size: Size1) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }

    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

struct AudioChannel {
    var newValue = "1"
    var oldValue1 = "2"
    static let title = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.title {
                currentLevel = AudioChannel.title
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

class SubLabel: UILabel {
    override var text: String? {
        willSet {
            print(newValue ?? "")
        }
        didSet {
            print(oldValue ?? "")
        }
    }
}

class SwiftProperty: UIViewController, SwiftBaseProtocol {
    override func viewDidLoad() {
        test()
    }

    func test() {
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6

        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        print(manager.importer.fileName)

        var square = Rect(origin: Point(x: 0.0, y: 0.0),
                          size: Size(width: 10.0, height: 10.0))
        _ = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896

        var rectangle = SmallRectangle()
        print(rectangle.height)
        rectangle.height = 10
        print(rectangle.height)
        rectangle.height = 24
        print(rectangle.height)

        let zeroRectangle = ZeroRectangle()
        print(zeroRectangle.height, zeroRectangle.width)

        let unitRectangle = UnitRectangle()
        print(unitRectangle.height, unitRectangle.width)

        var narrowRectangle = NarrowRectangle()
        print(narrowRectangle.height, narrowRectangle.width)

        narrowRectangle.height = 100
        narrowRectangle.width = 100
        print(narrowRectangle.height, narrowRectangle.width)
        var mixedRectangle = MixedRectangle()
        print(mixedRectangle.height)

        mixedRectangle.height = 20
        print(mixedRectangle.height)

        var someStructure = SomeStructure()
        someStructure.someNumber = 4
        print(someStructure.$someNumber)
        someStructure.someNumber = 55
        print(someStructure.$someNumber)

        print(SomeStructure.storedTypeProperty)
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        print(SomeEnumeration.computedTypeProperty)
        print(SomeClass.computedTypeProperty)

        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
    }
}

//
//  SwiftInitialization.swift
//  confuse_test
//
//  Created by yjs on 2021/3/4.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }

    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

struct InitializationSize {
    var width = 0.0, height = 0.0
}

struct InitializationPoint {
    var x = 0.0, y = 0.0
}

struct InitializationRect {
    var origin = InitializationPoint()
    var size = InitializationSize()
    init() {}

    init(origin: InitializationPoint, size: InitializationSize) {
        self.origin = origin
        self.size = size
    }

    init(center: InitializationPoint, size: InitializationSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: InitializationPoint(x: originX, y: originY), size: size)
    }
}

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init()
    }

    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

class InitializationProduct {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: InitializationProduct {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        name = "[Untitled]"
    }

    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1 ... 8 {
            for j in 1 ... 8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()

    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

class SwiftInitialization: UIViewController, SwiftBaseProtocol {
    override func viewWillAppear(_ animated: Bool) {
        test()
    }

    func test() {
        let f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        // Prints "The default temperature is 32.0° Fahrenheit"

        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        print(boilingPointOfWater)
        // boilingPointOfWater.temperatureInCelsius 是 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        print(freezingPointOfWater)
        // freezingPointOfWater.temperatureInCelsius 是 0.0
        let bodyTemperature = Celsius(37.0)
        print(bodyTemperature)

        _ = Color(red: 1.0, green: 0.0, blue: 1.0)
        print(boilingPointOfWater)

        _ = Color(white: 0.5)

        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        cheeseQuestion.response = "Yes, I do like cheese."

        _ = ShoppingListItem()

        _ = InitializationSize(width: 2.0, height: 2.0)
        let zeroByTwo = InitializationSize(height: 2.0)
        print(zeroByTwo.width, zeroByTwo.height)

        let zeroByZero = InitializationSize()
        print(zeroByZero.width, zeroByZero.height)
        // 打印 "0.0 0.0"

        let basicRect = InitializationRect()
        print(basicRect)
        let originRect = InitializationRect(origin: InitializationPoint(x: 2.0, y: 2.0),
                                            size: InitializationSize(width: 5.0, height: 5.0))
        print(originRect)
        let centerRect = InitializationRect(center: InitializationPoint(x: 4.0, y: 4.0),
                                            size: InitializationSize(width: 3.0, height: 3.0))
        print(centerRect)
        // centerRect 的 origin 是 (2.5, 2.5)，size 是 (3.0, 3.0)

        let vehicle = Vehicle()
        print("Vehicle: \(vehicle.description)")
        // Vehicle: 0 wheel(s)

        let bicycle = Bicycle()
        print("Bicycle: \(bicycle.description)")
        // 打印“Bicycle: 2 wheel(s)”

        let hoverboard = Hoverboard(color: "silver")
        print("Hoverboard: \(hoverboard.description)")
        // Hoverboard: 0 wheel(s) in a beautiful silver

        _ = Food(name: "Bacon")

        let breakfastList = [
            ShoppingListItem2(),
            ShoppingListItem2(name: "Bacon"),
            ShoppingListItem2(name: "Eggs", quantity: 6),
        ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            print(item.description)
        }
        // 1 x orange juice ✔
        // 1 x bacon ✘
        // 6 x eggs ✘

        let someCreature = Animal(species: "Giraffe")
        // someCreature is of type Animal?, not Animal

        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        // Prints "An animal was initialized with a species of Giraffe"

        let anonymousCreature = Animal(species: "")
        // anonymousCreature is of type Animal?, not Animal

        if anonymousCreature == nil {
            print("The anonymous creature couldn't be initialized")
        }
        // Prints "The anonymous creature couldn't be initialized"

        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // “This is a defined temperature unit, so initialization succeeded.”

        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // “This is not a defined temperature unit, so initialization failed.”

        let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
        if fahrenheitUnit2 != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // “This is a defined temperature unit, so initialization succeeded.”

        let unknownUnit2 = TemperatureUnit2(rawValue: "X")
        if unknownUnit2 == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // “This is not a defined temperature unit, so initialization failed.”

        if let twoSocks = CartItem(name: "sock", quantity: 2) {
            print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
        }
        // “Item: sock, quantity: 2”
        if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
            print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
            print("Unable to initialize zero shirts")
        }
        // “Unable to initialize zero shirts”
        let board = Chessboard()
        print(board.squareIsBlackAt(row: 0, column: 1))
        print(board.squareIsBlackAt(row: 7, column: 7))
    }
}

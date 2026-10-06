//
//  GrammarProbe.swift
//  confuse_test_swift
//
//  NOT part of the app flow. Holds the few Swift constructs a small realistic
//  app does not naturally contain, so the obfuscation modules that key on them
//  still have a bite. Keep this file tiny and construct-focused.
//

import Foundation

// indirect enum — recursion the app models never need.
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)

    func evaluate() -> Int {
        switch self {
        case .number(let value):
            return value
        case .addition(let lhs, let rhs):
            return lhs.evaluate() + rhs.evaluate()
        case .multiplication(let lhs, let rhs):
            return lhs.evaluate() * rhs.evaluate()
        }
    }
}

// Overridable type-computed property + deeply nested types.
class GeometryProbe {
    class var identityScale: Double { return 1.0 }

    struct Rect {
        struct Point {
            var x = 0.0
            var y = 0.0
        }
        var origin = Point()
        var width = 0.0
        var height = 0.0

        var area: Double { return width * height }
    }
}

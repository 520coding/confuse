//
//  SwiftString.swift
//  confuse_test
//
//  Created by yjs on 2021/5/2.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class SwiftString: UIViewController, SwiftBaseProtocol {
    override func viewDidAppear(_ animated: Bool) {
        test()
    }

    func test() {
        let someString = "Some string literal value"
        print(someString)
        
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        print(quotation)

        let singleLineString = "These are the same."
        let multilineString = """
        These are the same.
        """
        print(singleLineString)
        print(multilineString)


        let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        print(softWrappedQuotation)

        let lineBreaks = """

        This string starts with a line break.
        It also ends with a line break.

        """
        print(lineBreaks)

        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        // "Imageination is more important than knowledge" - Enistein
        print(wiseWords)

        let dollarSign = "\u{24}"             // $，Unicode U+0024
        print(dollarSign)

        let blackHeart = "\u{2665}"           // ♥，Unicode U+2665
        print(blackHeart)

        let sparklingHeart = "\u{1F496}"      // 💖，Unicode U+1F496
        print(sparklingHeart)

        
        let threeDoubleQuotes = """
        Escaping the first quote \"""
        Escaping all three quotes \"\"\"
        """
        print(threeDoubleQuotes)

        let threeMoreDoubleQuotationMarks0 = #"Line 1 \nLine 2"#
        print(threeMoreDoubleQuotationMarks0)

        let threeMoreDoubleQuotationMarks1 = #"Line 1 \#nLine 2"#
        let threeMoreDoubleQuotationMarks2 = ###"Line 1 \###nLine 2"###
        print(threeMoreDoubleQuotationMarks1)
        print(threeMoreDoubleQuotationMarks2)

        let threeMoreDoubleQuotationMarks3 = #"""
        Here are three more double quotes: """
        """#
        print(threeMoreDoubleQuotationMarks3)

        let emptyString = ""
        print(emptyString)

        let anotherEmptyString = String()
        print(anotherEmptyString)
        
        if emptyString.isEmpty {
            print("Nothing to see here")
        }

        var variableString = "Horse"
        variableString += " and carriage"

        for character in "Dog!🐶" {
            print(character)
        }
        // D
        // o
        // g
        // !
        // 🐶
        let exclamationMark1: Character = "!"
        print(exclamationMark1)

        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        // print：“Cat!🐱”
        
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        print(welcome)

        var instruction = "look over"
        instruction += string2
        print(instruction)

        let exclamationMark2: Character = "!"
        welcome.append(exclamationMark2)
        print(welcome)

        let badStart = """
        one
        two
        """
        let end = """
        three
        """
        print(badStart + end)
        // print:
        // one
        // twothree

        let goodStart = """
        one
        two

        """
        print(goodStart + end)
        // print:
        // one
        // two
        // three
        
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        // message "3 times 2.5 is 7.5"
        
        print(#"Write an interpolated string in Swift using \(multiplier)."#)
        // print "Write an interpolated string in Swift using \(multiplier)."
        
        print(#"6 times 7 is \#(6 * 7)."#)
        // print "6 times 7 is 42."
        
        let eAcute: Character = "\u{E9}"                         // é
        let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
        print(eAcute)
        print(combinedEAcute)

        // eAcute is é, combinedEAcute is é
        
        let precomposed: Character = "\u{D55C}"                  // 한
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
        print(precomposed)
        print(decomposed)
        // precomposed is 한, decomposed is 한
        
        let enclosedEAcute: Character = "\u{E9}\u{20DD}"
        print(enclosedEAcute)
        // enclosedEAcute is é⃝
        
        let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
        print(regionalIndicatorForUS)
        // regionalIndicatorForUS 是 🇺🇸
        
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        // 打印输出“unusualMenagerie has 40 characters”
        
        var word = "cafe"
        print("the number of characters in \(word) is \(word.count)")
        // 打印输出“the number of characters in cafe is 4”

        word += "\u{301}"    // 拼接一个重音，U+0301

        print("the number of characters in \(word) is \(word.count)")
        // 打印输出“the number of characters in café is 4”
        
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex])
        // G
        print(greeting[greeting.index(before: greeting.endIndex)])
        // !
        print(greeting[greeting.index(after: greeting.startIndex)])
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        print(greeting[index])
        // a
        for index in greeting.indices {
           print("\(greeting[index]) ", terminator: "")
        }
        // 打印输出“G u t e n   T a g ! ”
        
        var welcome1 = "hello"
        welcome1.insert("!", at: welcome1.endIndex)
        // welcome1 变量现在等于 "hello!"

        welcome1.insert(contentsOf:" there", at: welcome1.index(before: welcome1.endIndex))
        // welcome1 变量现在等于 "hello there!"
        
        welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
        // welcome1 现在等于 "hello there"

        let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
        welcome1.removeSubrange(range)
        // welcome1 现在等于 "hello"
        
        let greeting1 = "Hello, world!"
        let index1 = greeting1.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index1]
        // beginning 的值为 "Hello"

        // 把结果转化为 String 以便长期存储。
        let newString = String(beginning)
        print(newString)
        
        let quotation1 = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation1 == sameQuotation {
            print("These two strings are considered equal")
        }
        // 打印输出“These two strings are considered equal”
        
        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

        if eAcuteQuestion == combinedEAcuteQuestion {
            print("These two strings are considered equal")
        }
        // 打印输出“These two strings are considered equal”
        
        let latinCapitalLetterA: Character = "\u{41}"

        let cyrillicCapitalLetterA: Character = "\u{0410}"

        if latinCapitalLetterA != cyrillicCapitalLetterA {
            print("These two characters are not equivalent")
        }
        // 打印“These two characters are not equivalent”
        
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        // 打印输出“There are 5 scenes in Act 1”
        
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
        // 打印输出“6 mansion scenes; 2 cell scenes”
        
        let dogString = "Dog‼🐶"
        for codeUnit in dogString.utf8 {
            print("\(codeUnit) ", terminator: "")
        }
        print("")
        // 68 111 103 226 128 188 240 159 144 182
        
        for codeUnit in dogString.utf16 {
            print("\(codeUnit) ", terminator: "")
        }
        print("")
        // 68 111 103 8252 55357 56374
        for scalar in dogString.unicodeScalars {
            print("\(scalar.value) ", terminator: "")
        }
        print("")
        // 68 111 103 8252 128054
        
        for scalar in dogString.unicodeScalars {
            print("\(scalar) ")
        }
        // D
        // o
        // g
        // ‼
        // 🐶
    }
}

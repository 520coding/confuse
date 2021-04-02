//
//  SwiftDeinitialization.swift
//  confuse_test
//
//  Created by yjs on 2021/3/4.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class Bank {
    static var coinsInBank = 10000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }

    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class DeinitializationPlayer {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }

    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }

    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

class SwiftDeinitialization: UIViewController, SwiftBaseProtocol {
    override func viewWillAppear(_ animated: Bool) {
        test()
    }

    func test() {
        var playerOne: DeinitializationPlayer? = DeinitializationPlayer(coins: 100)
        print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        // Prints "A new player has joined the game with 100 coins"
        print("There are now \(Bank.coinsInBank) coins left in the bank")
        // Prints "There are now 9900 coins left in the bank"

        playerOne!.win(coins: 2000)
        print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        // Prints "PlayerOne won 2000 coins & now has 2100 coins"
        print("The bank now only has \(Bank.coinsInBank) coins left")
        // Prints "The bank now only has 7900 coins left"

        playerOne = nil
        print("PlayerOne has left the game")
        // Prints "PlayerOne has left the game"
        print("The bank now has \(Bank.coinsInBank) coins")
        // Prints "The bank now has 10000 coins"
    }
}

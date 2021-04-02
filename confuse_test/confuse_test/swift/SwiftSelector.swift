//
//  SwiftSelector.swift
//  confuse_test
//
//  Created by yjs on 2021/3/4.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController {
    var cyanButton: UIButton!
    var anotherCyanButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let methodA = #selector(cyanButtonClick as () -> Void)
        let methodB = #selector(cyanButtonClick as (UIButton) -> Void)

        cyanButton.addTarget(self,
                             action: methodA,
                             for: .touchUpInside)
        anotherCyanButton.addTarget(self,
                                    action: methodB,
                                    for: .touchUpInside)
    }

    @objc func cyanButtonClick() {
        print(#function)
    }

    @objc private func cyanButtonClick(_ button: UIButton) {
        let btnLabel = button.titleLabel?.text ?? "nil"
        print(btnLabel)
        print(#function)
    }
}

class SelectorViewController1: UIViewController {
    @objc private func privateFunc() {
        print(#function)
    }

    @objc func defaultFunc() {
        print(#function)
    }
}

class SelectorViewController2: SelectorViewController1 {
    var cyanButton: UIButton!
    var anotherCyanButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        cyanButton.addTarget(self,
                             action: #selector(defaultFunc),
                             for: .touchUpInside)
        anotherCyanButton.addTarget(self,
                                    action: Selector("privateFunc"),
                                    for: .touchUpInside)
    }
}

class SwiftSelectorObject: NSObject {
    @objc dynamic var firstName: String
    dynamic let lastName: String
    dynamic var fullName: String {
        return "\(firstName) \(lastName)"
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

fileprivate extension Selector {
    static let firstNameGetter = #selector(getter: SwiftSelectorObject.firstName)
    static let firstNameSetter = #selector(setter: SwiftSelectorObject.firstName)
}

class SwiftSelector: UIViewController, SwiftBaseProtocol {
    func test() {
    }
}

//
//  Product.swift
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.
//

import Foundation
import UIKit

class Product {
    var view = UIView()
    var viewController = UIViewController()
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?

    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }

    func test(v1: UIView, vc1: UIViewController) -> Int {
        var v2 = UIView()
        var vc2 = UIViewController()
        v2 = view
        vc2 = viewController
        _ = Data().last(where: {
            if $0 == 1 {
                return true
            }
            return false
        })
        print(v2.frame)
        if let title = vc2.title {
            print(title)
        }
        return 1
    }

    deinit {
    }
}

class TestViewController: UIViewController {
    override func viewDidLoad() {
        let view = UIView()
        self.view.addSubview(view)
    }

    func test(v: UIView) {
        view.addSubview(v)
        let v1 = UIView()
        self.view = v1
        view.addSubview(v1)
        self.title = "a1"
        self.getView1(v: view)?.addSubview(v1)
        self.getView1(v: view)?.addSubview(self.getView2(v: v1) ?? view)
    }
    
    func getView1(v name:UIView) -> UIView? {
        return name
    }
    func getView2(v name:UIView) -> UIView? {
        return name
    }

}

extension TestViewController {
    func test1(v: UIView) {
        view.addSubview(v)
        let v2 = UIView()
        self.view = v2
        view.addSubview(v2)
        self.title = "a2"
    }
}

class TestView: UIView {
    func test() {
        let view = UIView()
        addSubview(view)
    }
}


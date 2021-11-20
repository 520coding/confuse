//
//  FrameViewController.swift
//  confuse_test
//
//  Created by yjs on 2021/11/9.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {
    var width = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }

    func test() {
        self.width += 20.0

        let view = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 400))
        view.backgroundColor = .red
        view.layer.borderWidth = 1.0
        view.layer.shadowRadius = 2.0
        view.layer.cornerRadius = 3.0
        view.layer.cornerRadius = view.layer.borderWidth

        view.layer.borderWidth = view.layer.borderWidth
        view.layer.shadowRadius = 2.0
        view.layer.cornerRadius = 3.0
        self.view.addSubview(view)
        
        let smallRect = view.frame.insetBy(dx: 10 , dy: 10)
        let view1 = UIView(frame: smallRect)
        view1.backgroundColor = UIColor.yellow
        view1.center = CGPoint.zero
        view1.center = CGPoint(x: 10, y: 100)
        view1.layer.anchorPoint = CGPoint.init(x: 0, y: 0)
        view1.alpha = 1
        self.view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect.zero)
        view2.frame = CGRect(x: 10, y: 100, width: 20, height: 40)
        view2.backgroundColor = UIColor.blue
        self.view.addSubview(view2)
        
        let button = UIButton(frame: CGRect.init(x: view2.frame.maxX, y: view2.frame.origin.y, width: 40, height: 40))
        button.backgroundColor = .green
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        button.setTitle("yjs", for: .normal)
        self.view.addSubview(button)
        
        let x = view.frame.origin.x
        let y = view.frame.origin.y
        let w = view.frame.size.width
        let h = view.frame.size.height
        let view3 = UIView(frame: CGRect(x: x / 10, y: y, width: w / 4, height: h))
        view3.backgroundColor = UIColor.black
        view3.alpha = 0.5
        self.view.addSubview(view3)
        
        var size = CGSize(width: 1, height: 1)
        size.width += 0.1
        size.height += 20.0
        
        var origin = CGPoint(x: 0, y: 0)
        origin.x = 0.1
        origin.x += 1
        origin.x -= 1
        origin.x *= 1
        origin.x /= 1
        origin.x += 1
        origin.x -= 1
        origin.x += 1
        origin.x -= 1
    }
}

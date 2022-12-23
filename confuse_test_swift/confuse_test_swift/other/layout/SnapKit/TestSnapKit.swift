//
//  TestSnapKit.swift
//  confuse_test_swift
//
//  Created by yjs on 2022/12/17.
//

import SnapKit
import UIKit

class TestSnapKit: UIViewController {
    var width = 0.0
    lazy var tableView = UITableView()
    var button = UIButton()
    let otherView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(tableView)
        
        test()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }

    func test() {
        width += 20.0

        let box = UIView()
        view.addSubview(box)

        box.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.left.equalTo(view).offset(width)
            make.bottom.equalTo(view).offset(-20)
            make.right.equalTo(view).offset(-20 + width)
        }
    }

    func test1() {
        let superview = view!

        let box = UIView()
        superview.addSubview(box)

        box.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(superview).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }

    func testViewAttribute() {
        let superview = view!
        let label = UILabel()

        let box = UIView()
        superview.addSubview(box)

        box.snp.makeConstraints { (make) -> Void in
            make.centerX.lessThanOrEqualTo(label.snp.left)
            // these two constraints are exactly the same
            make.left.greaterThanOrEqualTo(label)
            make.left.greaterThanOrEqualTo(label.snp.left)
        }
    }

    func testStrictChecks() {
        let superview = view!
        let label = UILabel()

        let box = UIView()
        superview.addSubview(box)

        box.snp.makeConstraints { (make) -> Void in
            // ViewAttribute
            make.centerX.lessThanOrEqualTo(label.snp.left)
            // these two constraints are exactly the same
            make.left.greaterThanOrEqualTo(label)
            make.left.greaterThanOrEqualTo(label.snp.left)

            // width >= 200 && width <= 400
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualTo(400)
            // creates view.left <= view.superview.left + 10
            make.left.lessThanOrEqualTo(10)

            make.top.equalTo(42 + width * 2)
            make.height.equalTo((20 + width) / 100)
            make.size.equalTo(CGSize(width: 50, height: 100))
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            make.left.equalTo(view).offset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) as! ConstraintOffsetTarget)
        }
    }

    func testLearnToPrioritize() {
        let superview = view!
        let label = UILabel()

        let box = UIView()
        superview.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in

            make.top.equalTo(label.snp.top).priority(600)
            make.top.equalTo(label.snp.top).priority(.medium)
        }
    }

    // MARK: Composition, composition, composition

    func testeEdges() {
        let superview = view!
        let view2 = UIView()

        let box = UIView()
        superview.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
            // make top, left, bottom, right equal view2
            make.edges.equalTo(view2)

            // make top = superview.top + 5, left = superview.left + 10,
            //      bottom = superview.bottom - 15, right = superview.right - 20
            make.edges.equalTo(superview).inset(UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
        }
    }

    func testeSize() {
        let superview = view!
        let titleLabel = UILabel()

        let box = UIView()
        superview.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
            // make width and height greater than or equal to titleLabel
            make.size.greaterThanOrEqualTo(titleLabel)

            // make width = superview.width + 100, height = superview.height + 100
            make.size.equalTo(superview).offset(100)
        }
    }

    func testeCenter() {
        let superview = view!
        let button1 = UIButton()
        let otherView = UIView()

        let box = UIView()
        superview.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
            // make centerX and centerY = button1
            make.center.equalTo(button1)

            // make centerX = superview.centerX + 5, centerY = superview.centerY + 5
            make.center.equalTo(superview).offset(5)

            // All edges but the top should equal those of the superview
            make.left.right.bottom.equalTo(superview)
            make.top.equalTo(otherView)
        }
    }

    let topLeft = true
    let buttonSize = 1
    
    func changeButtonPosition() {
        button.snp.remakeConstraints { (make) -> Void in
            make.size.equalTo(self.buttonSize)

            if topLeft {
                make.top.left.equalTo(10)
            } else {
                make.bottom.equalTo(self.view).offset(-10)
                make.right.equalTo(self.view).offset(-10)
            }
        }
    }
}

class SnapKitView: UIView {
    var topConstraint: Constraint!
    let padding = UIEdgeInsets()
    let growingButton = UIButton()
    let buttonSize = CGSize()
    
    func test() {
        
        let view1 = UIView()
        
        // when making constraints
        view1.snp.makeConstraints { (make) -> Void in
            self.topConstraint = make.top.equalTo(superview!).offset(padding.top).constraint
            make.left.equalTo(superview!).offset(padding.left)
        }

        // then later you can call
        topConstraint.deactivate()

        // or if you want to update the constraint
        topConstraint.update(offset: 5)
        
        let button = UIButton()
        addSubview(button)
        
        button.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(growingButton).labeled("buttonViewTopConstraint")
        }
    }

    // this is Apple's recommended place for adding/updating constraints
    // this method can get called multiple times in response to setNeedsUpdateConstraints
    // which can be called by UIKit internally or in your code if you need to trigger an update to your constraints
    override func updateConstraints() {
        growingButton.snp.updateConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.width.equalTo(self.buttonSize.width).priority(250)
            make.height.equalTo(self.buttonSize.height).priority(250)
            make.width.lessThanOrEqualTo(self)
            make.height.lessThanOrEqualTo(self)
        }

        // according to Apple super should be called at end of method
        super.updateConstraints()
    }
}

class MyViewController: UIViewController {
    lazy var tableView = UITableView()
    let otherView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }

        button.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(otherView).labeled("buttonViewTopConstraint")
        }
    }
}

//
//  SwiftLottie.swift
//  confuse_test
//
//  Created by yjs on 2021/6/21.
//  Copyright © 2021 coding520. All rights reserved.
//

import Lottie
import UIKit

class SwiftLottie: UIViewController, SwiftBaseProtocol, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var dataSource = [SwiftLottieModel]()
    @IBOutlet var lottieLeft: LottieAnimationView!
    @IBOutlet var lottieMiddle: LottieAnimationView!
    @IBOutlet var lottieRight: LottieAnimationView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        test()
    }

    func test() {
        lottieLeft.play(toProgress: 1, loopMode: .loop)
        let lottiePath = Bundle.main.path(forResource: "number1.json", ofType: nil)
        lottieMiddle.animation = .filepath(lottiePath ?? "")
        lottieMiddle.play(toProgress: 1, loopMode: .loop)
        lottieRight.animation = .filepath(Bundle.main.path(forResource: "view_2", ofType: "json") ?? "")
        lottieRight.play(toProgress: 1, loopMode: .loop)
        
        Bundle.main.path(forResource: "工作", ofType: "json")
        _ = LottieAnimation.named("left")
        _ = LottieAnimationView(name: "success")
        _ = LottieAnimationView(name: "龙")
        _ = LottieAnimation.named("flash loader")
        _ = LottieAnimation.named("loading-h")
        let label = UILabel()
        label.text = "success"
        let btn = UIButton()
        btn.setTitle("left", for: .normal)
        _ = LottieAnimation.named("dots-\(1)")
        _ = LottieAnimation.named("my")
        _ = LottieAnimation.named("A")
        _ = LottieAnimation.named("number1")

        for i in 1 ... 3 {
            _ = LottieAnimation.named(String(format: "view_%lu", UInt(i)))
        }

        let data = [
            "Watermelon": "launch",
            "draft_icon": "loading",
            "loading.json": "confuse_test_swift",
            "servishero_loading": "hello",
            "view_1": "520coding/confuse",
            "loading-h.json": "discard file png",
            "scan": "scan",
            "flash loader.json": "image file",
        ]
        for (k, v) in data {
            let model = SwiftLottieModel()
            model.lottie = k
            model.title = v
            dataSource.append(model)
        }
        tableView.reloadData()
    }
}

extension SwiftLottie {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftLottieCell", for: indexPath)
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        let model = dataSource[indexPath.row]
        let lottie = LottieAnimationView(name: model.lottie)
        let screenWidth = UIScreen.main.bounds.width
        lottie.frame = CGRect(x: screenWidth - 100, y: 0, width: 100, height: 100)
        lottie.play(toProgress: 1, loopMode: .loop)
        cell.contentView.addSubview(lottie)
        cell.textLabel?.text = model.title
        return cell
    }
}

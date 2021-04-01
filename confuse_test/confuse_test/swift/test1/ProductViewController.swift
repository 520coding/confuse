//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    static var storedTypeProperty = "Some value."

    var product: Product?
    
    @objc func leftAction() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = product?.name

        if let imageName = product?.fullscreenImageName {
            productImageView.image = UIImage(named: imageName)
        }

        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 40, y: 50, width: 40, height: 40)
        btn.backgroundColor = UIColor.red
        view.addSubview(btn)
//        btn.addTarget(self, action: Selector("leftAction"), for: .touchUpInside)
        btn.addTarget(self, action: #selector(leftAction), for: .touchUpInside)

    }

    @IBAction func click(_ sender: AnyObject) {
        print("Add to cart successfully")
    }
}

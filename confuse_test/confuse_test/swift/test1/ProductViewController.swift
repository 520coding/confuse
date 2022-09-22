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
        btn.backgroundColor = UIColor.clear
        view.addSubview(btn)
//        btn.addTarget(self, action: Selector("leftAction"), for: .touchUpInside)
        btn.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        setFont()
    }

    func setFont() {
        let fontSize = 10
        let font = UIFont(name: "yjs", size: 11)
        print(font ?? "?")
        UIFont.systemFont(ofSize: 14)
        UIFont.systemFont(ofSize: -1 + 14)
        UIFont.boldSystemFont(ofSize: 13)
        UIFont.systemFont(ofSize: 11, weight: UIFont.Weight(2))
        UIFont.italicSystemFont(ofSize: 14)
        UIFont.monospacedDigitSystemFont(ofSize: 14, weight: UIFont.Weight(2))
        if #available(iOS 13.0, *) {
            UIFont.monospacedSystemFont(ofSize: 14, weight: UIFont.Weight(2))
        } else {
            // Fallback on earlier versions
        }

        productNameLabel.font = UIFont.systemFont(ofSize: 14); productNameLabel.font = UIFont.systemFont(ofSize: 14)
        productNameLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        let pointSize = productNameLabel.font.pointSize
        print(pointSize)
        let ascender = productNameLabel.font.ascender
        print(ascender)
        let descender = productNameLabel.font.descender
        print(descender)
        let capHeight = productNameLabel.font.capHeight
        print(capHeight)
        let xHeight = productNameLabel.font.xHeight
        print(xHeight)
        let lineHeight = productNameLabel.font.lineHeight
        print(lineHeight)
        let leading = productNameLabel.font.leading
        print(leading)
        productNameLabel.font.withSize(1.0)
    }

    @IBAction func click(_ sender: AnyObject) {
        print("Add to cart successfully")
    }
}

func pictureFloat(color number: CGFloat) -> CGFloat {
   return number
}

extension UILabel {
    func scaleFontSize() {
        self.font = UIFont(name: self.font.fontName,
                           size: pictureFloat(color: self.font.pointSize))
    }
}


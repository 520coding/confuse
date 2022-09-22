//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if #available(iOS 11.0, *) {
            scrollView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top)
        } else {
            scrollView.frame = CGRect(x: 0, y: topLayoutGuide.length, width: view.frame.width, height: view.frame.height - topLayoutGuide.length - bottomLayoutGuide.length)
        }

        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
    }
    
    func color() {
        var color = UIColor()
        color = UIColor(white: 0.1, alpha: 0.2)
        color = UIColor(hue: 0.10, saturation: 0.2, brightness: 0.3, alpha: 0.4)
        color = UIColor(red: 12, green: 13, blue: 1, alpha: 1)
        color = UIColor(red: 12,
                            green: 13,
                            blue: 1,
                            alpha: 1)
        color = UIColor(red:12, green:  13, blue:  1, alpha: 1)
        color = UIColor(displayP3Red: 0.1, green: 0.2, blue: 0.33, alpha: 0.21)
        
        color = UIColor.init()
        color = UIColor.init(white: 0.1, alpha: 0.2)
        color = UIColor.init(hue: 0.10, saturation: 0.2, brightness: 0.3, alpha: 0.4)
        color = UIColor.init(red: 12, green: 13, blue: 1, alpha: 1)
        color = UIColor.init(red: 12,
                            green: 13,
                            blue: 1,
                            alpha: 1)
        color = UIColor.init(red:12, green:  13, blue:  1, alpha: 1)
        color = UIColor.init(displayP3Red: 0.1, green: 0.2, blue: 0.33, alpha: 0.21)
        color = UIColor(named: "Color-1")!
        color = UIColor.init(named: "Color-2")!
        color = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        print(color)
    }
    
}

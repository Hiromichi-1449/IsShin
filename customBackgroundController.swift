//
//  customBackgroundController.swift
//  Single_Mind
//
//  Created by Ricardo Wu on 2018/7/2.
//  Copyright © 2018年 Ricardo Wu. All rights reserved.
//

import UIKit

class customBackgroundController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = UIColor.white
    }
}

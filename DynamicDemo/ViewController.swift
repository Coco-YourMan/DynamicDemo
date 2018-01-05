//
//  ViewController.swift
//  DynamicDemo
//
//  Created by Mr.Jeen on 2018/1/5.
//  Copyright © 2018年 Jeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topView:UXEarningGrantTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        topView = UXEarningGrantTopView.init(frame: CGRect.init(x: 10, y: 80, width: 300, height: 200))
        //topView.backgroundColor = .cyan
        self.view.addSubview(topView)
        
        topView.startAnimate()
        
    }


}


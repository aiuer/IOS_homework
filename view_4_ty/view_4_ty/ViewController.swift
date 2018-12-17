//
//  ViewController.swift
//  view_4_ty
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let oval = myView(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
        oval.backgroundColor = UIColor.purple
        self.view.addSubview(oval)
        
        let circle = myView(frame: CGRect(x: 50, y: 500, width: 200, height: 200))
        circle.backgroundColor = UIColor.blue
        self.view.addSubview(circle)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}


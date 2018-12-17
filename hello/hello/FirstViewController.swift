//
//  FirstViewController.swift
//  hello
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hello World!"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    @IBAction func btnClicked(){
        if let label = view.subviews.first as? UILabel{
               label.text = "I am Clicked!"
        }
    }
}

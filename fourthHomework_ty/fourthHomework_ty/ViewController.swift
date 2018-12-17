//
//  ViewController.swift
//  fourthHomework_ty
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 2016110439. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    var button:UIButton!
    override func viewDidLoad() {
        label = UILabel(frame: CGRect(x: 50, y: 220, width: 220, height: 60))
        label.text = "labelhahhahha"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25)
        self.view.addSubview(label)
        button = UIButton(frame: CGRect(x: 50, y: 500, width: 160, height: 20))
        button.backgroundColor = UIColor.green
        button.setTitle("Cickme", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clicked(){
        if label.text! == "Clicked" {
            label.text = "Hello World!"
        }else{
            label.text = "Clicked"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


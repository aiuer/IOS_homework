//
//  MyViewController.swift
//  HelloWorld_5_ty
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 2016110439. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let myView = MyView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        myView.drawCurve { (x) -> CGFloat in
            return x * x
        }
        self.view.addSubview(myView)
        
        label = UILabel(frame: CGRect(x: 50, y: 220, width: 220, height: 60))
        label.text = "我是Label"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25)
        self.view.addSubview(label)
        let button = UIButton(frame: CGRect(x: 50, y: 300, width: 160, height: 120))
        button.backgroundColor = UIColor.green
        button.setTitle("我是Button", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 400, width: self.view.frame.width - 20, height: (self.view.frame.width - 20)*0.618))
        let path = Bundle.main.path(forResource: "Dog", ofType: "png")
        let image = UIImage(contentsOfFile: path!)
        imageView.image = image
        self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
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

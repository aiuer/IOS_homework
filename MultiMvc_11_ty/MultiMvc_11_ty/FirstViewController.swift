//
//  ViewController.swift
//  MultiMvc_11_ty
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    var stu = Student()
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNO: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        tfNO.text = stu.NO
        tfName.text = stu.name
    }
    
    @IBAction func showSeconfview(_ sender: Any) {
        stu.NO = tfNO.text!
        stu.name = tfName.text!
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secVC.stu = stu
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThirdview(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
}


//
//  ViewController.swift
//  Action
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "Action sheet", message: "this is an ation sheet", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "RED", style: .default, handler: { (action) in print("ok clicked")
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "GREEN", style: .destructive, handler: { (action) in print("destructive clicked")
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "WHITE", style: .destructive, handler: { (action) in print("destructive clicked")
            self.view.backgroundColor = UIColor.white
        }))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Please input your personal information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {(action) in
            guard let userNameTextField = alert.textFields?.first?.text, let passWordTextField = alert.textFields?.last?.text else{
                return
            }
            print("username:\(userNameTextField.text!) password:\(passWordTextField.text)")
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: {(action) in
            
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "your user name??"
        }
        alert.addTextField{
            (textField) in
            textField.placeholder = "your user password??"
            textField.isSecureTextEntry = true
        }
        present(alert, animated: true,completion: nil)  }
}


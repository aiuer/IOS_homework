//
//  SecondViewController.swift
//  MultiMvc_11_ty
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var stu: Student!
    
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNO.text = stu.NO
        tfName.text = stu.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        stu.NO = tfNO.text!
        stu.name = tfName.text!
       
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

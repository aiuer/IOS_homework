//
//  ThirdViewController.swift
//  MultiMvc_11_ty
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var name = ""
    var NO = ""
    
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNO.text = NO
        tfname.text = name
    }
    
    
    @IBAction func close(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

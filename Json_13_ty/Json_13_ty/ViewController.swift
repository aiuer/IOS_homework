//
//  ViewController.swift
//  Json_13_ty
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loadWithurl(_ sender: Any) {
        DispatchQueue.global().async {
            if let url = URL(string: "http://10.0.1.2/pic.php?id=1"){
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.imageview1.image = UIImage(data: data)
                    }
                }
            }
        }
        
    }
    @IBAction func loadWithSession(_ sender: Any) {
        if let url = URL(string: "http://10.0.1.2/pic.php?id=2"){
            let task = URLSession.shared.dataTask(with: url){ (data,response,error) in DispatchQueue.main.async {
                    self.imageview2.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
    }
    @IBAction func loadWithAF(_ sender: Any) {
        if let url = URL(string: "http://10.0.1.2/pic.php?id=3"){
            AF.request(url).responseData { (respnse) in
                self.imageview2.image = UIImage(data: respnse.data!)
            }
        }
    }
    

}


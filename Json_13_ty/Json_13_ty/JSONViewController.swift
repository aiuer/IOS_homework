//
//  JSONViewController.swift
//  Json_13_ty
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Alamofire

class JSONViewController: UIViewController {

    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var weather:weather?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadWithAF(_ sender: Any) {
//        AF.request(url).responseJSON { (response) in
//
//            let json = response.value as! [[String:AnyObject]]
//            for weat  in json{
//                print("time:\(weat["time"] ?? "" as AnyObject)")
//            }
//            }
//        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
                self.weather = json as! weather
                for wea in json{
                    print("\(wea["time"] ?? "" as AnyObject)")
                }
//                DispatchQueue.main.async {
//                    self.performSegue(withIdentifier: "ShowPersons", sender: self)
//                }
            }
        }
        task.resume()
    }
    
 

}

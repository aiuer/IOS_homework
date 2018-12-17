//
//  WeatherDetailViewController.swift
//  Json_13_ty
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDetailViewController: UIViewController {

    var weather:[String:AnyObject]?
    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var cityInfo: UILabel!
    @IBOutlet weak var Messeage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

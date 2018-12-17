//
//  WeatherTableViewController.swift
//  Json_13_ty
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
import Alamofire

class WeatherTableViewController: UITableViewController {

    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var weather:[[String:AnyObject]]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weather?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = weather?[indexPath.row]["time"] as! String
        cell.detailTextLabel?.text = weather?[indexPath.row]["cityInfo"] as! String
        
        if let imagePath = weather?[indexPath.row]["imagePath"] {
            if let url = URL(string: "http://10.0.1.2/\(imagePath)") {
                AF.request(url).responseData { (response) in
                    cell.imageView?.image = UIImage(data: response.data!)
                    cell.setNeedsLayout()
                }
            }
        }
        return cell
    }
   
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let secVC = segue.destination as? WeatherDetailViewController {
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                secVC.weather = weather?[indexPath.row]
            }
        }
    }

    
}

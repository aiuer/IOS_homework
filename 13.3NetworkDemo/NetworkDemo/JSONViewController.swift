
import UIKit
import Alamofire

class JSONViewController: UIViewController {
    
    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var weather:AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadWithAF(_ sender: Any) {
        AF.request(url).responseJSON { (response) in
            self.weather = response.value as AnyObject
            self.performSegue(withIdentifier: "ShowCity", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCity" {
            if let secVC = segue.destination as? CityTableViewController {
                secVC.weather = self.weather
            }
        }
    }
}

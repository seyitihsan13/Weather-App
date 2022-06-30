//
//  ViewController.swift
//  Weather
//
//  Created by İhsan Elkatmış on 30.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ıstanbulLbl: UILabel!
    
    @IBOutlet weak var IstanbulLabel: UILabel!
    
    let api = "da6e9d2bb94395b98a17c1d20444f828"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hava Durumu"
    }

    @IBAction func resultButton(_ sender: Any) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=40.925321&lon=29.288659&appid=\(api)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        
                        DispatchQueue.main.async {
                            if let main = jsonResponse!["main"] as? [String:Any ]{
                                if let temp = main["temp"] as? Double {
                                    self.IstanbulLabel.text = "İSTANBUL: \(Int(temp-272.15))"
                                    
                            }
                        }
                        }
                        
                    } catch {
                        

                }
            }
        }
        }
        task.resume()
        
    }
                        
    
    }
    





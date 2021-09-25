//
//  ViewController.swift
//  NewProject
//
//  Created by Shreesha on 22/09/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTable: UITableView!
    
    var vegetableList = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getJSONData()
        
    }
    
    func getJSONData(){
        
        let urlFile = "http://haritibhakti.com/jsondata/vegetables.json"
        AF.request(urlFile).responseJSON { (response) in
            
            switch response.result {
            
            
            case .success(let value):
                let jsondata = value as! [[String : Any]]?
                self.vegetableList = jsondata!
                self.myTable.reloadData()
                
            case .failure(let error):
                print("Error Occures \(error.localizedDescription)")
            }
            
        }
    }

   
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.myLabel.text = vegetableList[indexPath.row]["name"] as? String
        
        let urlImage = vegetableList[indexPath.row]["imagename"] as? String
        
        AF.request(urlImage!).responseImage{ (response) in
            
            switch response.result {
            
            case .success(let value):
                DispatchQueue.main.async {
                    cell.myImage.image = value
                }
    
            case .failure(let error):
                print("Error \(error)")
            }
                
            }
            
        return cell
            
        }
        
        
    }
    
    



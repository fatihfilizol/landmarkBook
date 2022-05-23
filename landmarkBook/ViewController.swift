//
//  ViewController.swift
//  landmarkBook
//
//  Created by Fatih Filizol on 23.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    var landmarkNames = [String] ()
    var landmarkImages = [UIImage] ()
    var chosenLandmarNames = ""
    var chosenLandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
        
        //LANDMARKBOOK DATA
        
        landmarkNames.append("Yuvarlak Çay")
        landmarkNames.append("Azmak Nehri")
        landmarkNames.append("Ölüdeniz")
        landmarkNames.append("Sedir Adası")
        landmarkNames.append("Kız Kumu")
        
        
        landmarkImages.append(UIImage(named: "yuvarlakcay")!)
        landmarkImages.append(UIImage(named: "azmaknehri")!)
        landmarkImages.append(UIImage(named: "oludeniz")!)
        landmarkImages.append(UIImage(named: "sediradasi")!)
        landmarkImages.append(UIImage(named: "kizkumu")!)
        
        navigationItem.title = "Landmark Book"
        
    }
    
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarNames = landmarkNames[indexPath.row]
        chosenLandmarkImages = landmarkImages[indexPath.row]
        
        
        
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! ViewControllerDetail
            destinationVC.selectedLandmarkName = chosenLandmarNames
            destinationVC.selectedLandmarkImage = chosenLandmarkImages
        }
    }


}


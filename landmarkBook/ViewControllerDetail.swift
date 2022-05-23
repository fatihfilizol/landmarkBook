//
//  ViewControllerDetail.swift
//  landmarkBook
//
//  Created by Fatih Filizol on 23.05.2022.
//

import UIKit

class ViewControllerDetail: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblName.text = selectedLandmarkName
        imgView.image = selectedLandmarkImage
        
    }
    
    
}

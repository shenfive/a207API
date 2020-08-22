//
//  ViewController.swift
//  a207API
//
//  Created by 申潤五 on 2020/8/22.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var bigHade: UIImageView!
    @IBOutlet weak var ind: UIActivityIndicatorView!
    
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var telL: UILabel!
    @IBOutlet weak var nameL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUser()
 

 
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bigHade.clipsToBounds = true
        bigHade.layer.cornerRadius = bigHade.bounds.size.height / 2
        bigHade.layer.borderColor = UIColor.black.cgColor
        bigHade.layer.borderWidth = 3
        
        
    }
    

    @IBAction func nextUser(_ sender: Any) {
        updateUser()
    }
    
    func updateUser(){
        self.ind.isHidden = false
        self.ind.startAnimating()
        let model = APIModel.share
        model.queryRandomUser { (respons, error) in
            self.ind.isHidden = true
            self.ind.startAnimating()
            let json = JSON(respons as! Data)
            let imageString  = json["results"].arrayValue[0]["picture"]["large"].stringValue
            if let url = URL(string: imageString){
                self.bigHade.kf.setImage(with: url)
            }
            self.telL.text = json["results"].arrayValue[0]["phone"].stringValue
            let nameJson = json["results"].arrayValue[0]["name"]
            self.nameL.text = "\(nameJson["title"].stringValue) \(nameJson["first"].stringValue) \(nameJson["last"].stringValue)"
            self.emailL.text = json["results"].arrayValue[0]["email"].stringValue
            
            
            
        }
    }
    
}


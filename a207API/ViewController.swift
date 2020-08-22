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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUser()
 
        
    }

    @IBAction func nextUser(_ sender: Any) {
        updateUser()
    }
    
    func updateUser(){
        let model = APIModel.share
        model.queryRandomUser { (respons, error) in
            let json = JSON(respons as! Data)
            let imageString  = json["results"].arrayValue[0]["picture"]["large"].stringValue
            if let url = URL(string: imageString){
                self.bigHade.kf.setImage(with: url)
            }
        }
    }
    
}


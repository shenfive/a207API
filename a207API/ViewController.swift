//
//  ViewController.swift
//  a207API
//
//  Created by 申潤五 on 2020/8/22.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = APIModel.share
        model.queryRandomUser { (respons, error) in
            let json = JSON(respons as! Data)
            print(json["results"].arrayValue[0]["name"]["first"].stringValue)
        }
        
    }


}


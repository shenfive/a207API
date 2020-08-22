//
//  APIModel.swift
//  a207API
//
//  Created by 申潤五 on 2020/8/22.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIModel{
    
    static var share = APIModel()
    private var apiURL = "https://randomuser.me/"
    private init(){}
    
    func queryRandomUser(completion:@escaping (_ Data:Any?,_ respError: Error?)->())->(){
        
        DispatchQueue.global().async {

            let url = self.apiURL + "/api"
            
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: nil).responseJSON { (respons) in
                        let json = JSON(respons.data!)
                        print(json)
            }
        
            
            
        
        }
    }
    
    
    
}

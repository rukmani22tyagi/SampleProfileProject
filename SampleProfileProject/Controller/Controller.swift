//
//  Controller.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Controller {
    
    var mappedObject: JsonModel?
    
    func getData(token: String, completed: @escaping DownloadComplete) {
        let url = StaticURL.postURL + token
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let json) :
                self.mappedObject = Mapper<JsonModel>().map(JSONObject: json)
            case .failure(let err):
                print(err.localizedDescription)
            }
            completed(self.mappedObject)
        }
    }
}

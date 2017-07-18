//
//  Location.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import Foundation
import ObjectMapper

class Location: Mappable {
    var name: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}

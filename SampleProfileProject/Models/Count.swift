//
//  Count.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import Foundation
import ObjectMapper

class Count: Mappable {
    var count: Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        count <- map["count"]
    }
}

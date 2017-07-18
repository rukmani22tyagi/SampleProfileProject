//
//  DataList.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import Foundation
import ObjectMapper

class DataList: Mappable {
    var caption: Caption?
    var location: Location?
    var images: Images?
    var likes: Count?
    var comments: Count?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        caption <- map["caption"]
        location <- map["location"]
        images <- map["images"]
        likes <- map["likes"]
        comments <- map["comments"]
    }
}

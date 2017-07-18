//
//  Post.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import Foundation

class Post {
    
    var postCaption: String
    var location: String
    var imageUrl: String
    var likes: Int
    var comments: Int

    init(_caption: String?, _location: String?, _imageUrl: String?, _likes: Int?, _comments: Int?) {
        self.postCaption = _caption ?? ""
        self.location = _location ?? ""
        self.imageUrl = _imageUrl ?? ""
        self.likes = _likes ?? 0
        self.comments = _comments ?? 0
    }
}

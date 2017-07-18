//
//  PostViewCell.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    func configureCell(caption: String, location:String, postImageURL: String, likes: String, comments: String) {
        self.captionLabel.text = caption
        self.locationLabel.text = location
        self.likeLabel.text = likes
        self.commentLabel.text = comments
        
        let url = URL(string: postImageURL)
        DispatchQueue.main.async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.global().sync {
                    self.postImageView.image = UIImage(data: data)
                }
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
    }

}

//
//  PostViewController.swift
//  SampleProfileProject
//
//  Created by Rukmani  on 18/07/17.
//  Copyright © 2017 rukmani. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var posts = [Post]()
    var filteredPosts = [Post]()
    let controller = Controller()
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar {
        return searchController.searchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = true
        
        //set search bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.titleView = searchController.searchBar
        
        //get posts
        controller.getData(token: StaticURL.accessToken, completed: { mappedObject in
            for postData in (mappedObject?.data)! {
                let post = Post(_caption: postData.caption?.text, _location: postData.location?.name, _imageUrl: postData.images?.standardResolution?.url, _likes: postData.likes?.count, _comments: postData.comments?.count)
                self.posts.append(post)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    func filterPosts(searchText: String) {
        filteredPosts = posts.filter { post in
            let textToSearch = searchText.lowercased()
            let postText = post.postCaption.lowercased() + post.location.lowercased()
            let result = postText.contains(textToSearch)
            return result
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostViewCell else {
            return 160
        }
        return cell.postImageView.bounds.height + 5
    }
}

extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive && searchBar.text != "") {
            return self.filteredPosts.count
        } else {
            return self.posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostViewCell else {
            return UITableViewCell()
        }
        let post: Post
        if (searchController.isActive && searchBar.text != "") {
            post = self.filteredPosts[indexPath.row]
        } else {
            post = self.posts[indexPath.row]
        }
        cell.configureCell(caption: post.postCaption, location: post.location, postImageURL: post.imageUrl, likes: "\(post.likes)", comments: "\(post.comments)")
        return cell
    }
}

extension PostViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchBar.text ?? ""
        filterPosts(searchText: text)
    }
}

//
//  SearchResultTableViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 27.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

protocol friendButtonDelegate {
    func displayAlert(alertController: UIAlertController)
}

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var searchResultImage: UIImageView!
    @IBOutlet weak var searchResultName: UILabel!
    @IBOutlet weak var addFriendButton: UIButton!
    
    var friendStatus: String = "Add Friend" // Pending, IsFriend, Add Friend
    
    var DatabaseManager: FIRDatabaseManager?
    var searchResult: searchResult?
    
    var delegate: friendButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addFriendButton.isHidden = true
        searchResultImage.layer.cornerRadius = (64 - (2*8))/2
        self.addFriendButton.layer.cornerRadius = self.addFriendButton.frame.height/2
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func configure(searchResult: searchResult) {
        self.searchResult = searchResult
        // request, Friends, Pending
        self.setButtonTo(status: searchResult.friendStatus)
        self.searchResultName.text = searchResult.name
        self.searchResultImage.image = UIImage(systemName: searchResult.imageName)
        
    }
    
    func setButtonTo(status: String) {
        if status == "Request" {
            self.addFriendButton.isHidden = false
            self.addFriendButton.isSelected = false
        } else if status == "Pending" {
            self.addFriendButton.isHidden = false
            self.addFriendButton.isSelected = true
        } else if status == "Friends" {
            self.addFriendButton.isHidden = true
        } else if status == "Accept" {
            self.addFriendButton.isHidden = false
            self.addFriendButton.isSelected = false
            
            // Show the decline button, or x to cancel
            
        }
        self.addFriendButton.setTitle(status, for: .normal)
    }
    

    
    @IBAction func addFriendTapped(_ sender: UIButton) {
        guard var result = self.searchResult else { return }
        
        print("friendStatus: \(result.friendStatus) -> CHANGE TO ____________________")
        
        if let databaseManager = self.DatabaseManager {
            if let del = self.delegate {
                if sender.isSelected {
                    // Result friend request is Pending, if tapped display alert-> about to unfriend ....
                    let alertController = UIAlertController(title: "Delete Friend Request", message: "Are you sure you want to continue?", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
                        // Remove friend invites and friends
                        print("Remove friend invites and friends")
                        databaseManager.removeFriendRequest(to: result.id)
                        self.setButtonTo(status: "Request")
                    }))
                    alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
                        // Don't do anything
                        print("Don't do anything")
                    }))
                    
                    
                    del.displayAlert(alertController: alertController)
                    
                    
                    
                } else {
                    
                    // check if friendsStatus is Request, or pending
                    
                    if result.friendStatus == "Request" {
                        databaseManager.sendFriendRequest(to: result.id)
                        result.friendStatus = "Pending"
                        
                    } else if result.friendStatus == "Accept" {
                        databaseManager.acceptFriendRequest(from: result)
                        result.friendStatus = "Friends"
                        
                    }
                    self.setButtonTo(status: result.friendStatus)
                    
                    
                }
            }
        }
        
        
    }
    
    
    static let identifier = "SearchResultTableViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "SearchResultTableViewCell", bundle: nil)
    }
    
}

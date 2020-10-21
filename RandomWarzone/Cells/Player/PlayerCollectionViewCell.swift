//
//  PlayerCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 19.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

public let darkTheme: UIColor = UIColor(red: 63/255, green: 82/255, blue: 98/255, alpha: 1)

class PlayerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var squadImageView: UIImageView!
    @IBOutlet weak var squadNameLabel: UILabel!
    @IBOutlet weak var squadSubTitleLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    func configureRegiment(regiment: Regiment) {
        self.squadImageView.image = UIImage(systemName: regiment.imageName)
        
        
        
        self.squadNameLabel.text = regiment.name
        
        var regimentMembers = ""
        for member in regiment.members {
            if member == regiment.members.last {
                regimentMembers += "\(member.name)"
            } else {
                regimentMembers += "\(member.name),"
            }
        }
        
        self.squadSubTitleLabel.text = regimentMembers
    }
    
    func configureSquad(squad: Squad) {
        self.squadImageView.image = UIImage(systemName: squad.imageName)
        self.squadNameLabel.text = squad.gamemode
        
        
        var squadMembers = ""
        for member in squad.members {
            if member == squad.members.last {
                squadMembers += "\(member.name)"
            } else {
                squadMembers += "\(member.name), "
            }
        }
        
        self.squadSubTitleLabel.text = squadMembers
    }
    
    func configureFriend(friend: Friend) {
        self.squadImageView.image = UIImage(systemName: friend.imageName)
        self.squadNameLabel.text = friend.name
        self.squadSubTitleLabel.text = friend.desc
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.squadImageView.layer.masksToBounds = false
        self.squadImageView.layer.cornerRadius = (self.frame.height*0.75)*0.5
        self.squadImageView.layer.borderColor = darkTheme.cgColor
        self.squadImageView.layer.borderWidth = 1.5
        
        self.squadImageView.contentMode = .scaleAspectFit
        self.squadImageView.clipsToBounds = true
    }
    
    static let identifier = "PlayerCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayerCollectionViewCell", bundle: nil)
    }

}

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
    
    @IBOutlet weak var notificationLabel: UILabel!
    
    var numNotifications: Int = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.notificationLabel.layer.cornerRadius = self.notificationLabel.frame.height/2
        self.notificationLabel.layer.borderColor = UIColor.systemBackground.cgColor
        self.notificationLabel.layer.borderWidth = 2
        self.notificationLabel.clipsToBounds = true
        
        self.setNotificationLabel()
        self.squadImageView.tintColor = .lightGray
        
    }
    
    func setNumNotifications(to: Int) {
        self.numNotifications = to
    }
    
    func setNotificationLabel() {
//        self.notificationLabel.text = String(self.numNotifications)
        self.notificationLabel.isHidden = (self.numNotifications==0)
    }
    
    
    
    func configure(regiment: Regiment? = nil, squad: Squad? = nil, player: Player? = nil) {
        
        var imageToConfigure = UIImage()
        
        var nameToConfigure = ""
        var subTitleToConfigure = ""
        
        if let regimentToConfigure = regiment {
            // setup Regiment
            imageToConfigure = UIImage(data: regimentToConfigure.img!)!
            nameToConfigure = regimentToConfigure.id!
            subTitleToConfigure = "FUNCTION NEEDED FOR THIS"
        } else if let squadToConfigure = squad {
            // setup SQuad
            imageToConfigure = UIImage(data: squadToConfigure.img!)!
            nameToConfigure = squadToConfigure.id!
            subTitleToConfigure = "FUNCTION NEEDED FOR THIS"
            
        } else if let playerToConfigure = player {
            // setup SQuad
            imageToConfigure = UIImage(data: playerToConfigure.img!)!
            nameToConfigure = playerToConfigure.id!
            subTitleToConfigure = "FUNCTION NEEDED FOR THIS"
        }
        
        
        self.squadImageView.image = imageToConfigure
        self.squadNameLabel.text = nameToConfigure
        self.squadSubTitleLabel.text = subTitleToConfigure
        
        
        
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

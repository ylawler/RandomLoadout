//
//  GamerCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 22.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class GamerCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var gamerImageView: UIImageView!
    
    var gamer: Gamer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        self.gamerImageView.layer.masksToBounds = false
        self.gamerImageView.layer.cornerRadius = (self.frame.height - 16)/2
        self.gamerImageView.layer.borderColor = darkTheme.cgColor
        self.gamerImageView.layer.borderWidth = 1.5
        
        self.gamerImageView.contentMode = .scaleAspectFit
        self.gamerImageView.clipsToBounds = true
    }
    
//    func configure(gamerId: String) {
//        FIRDatabaseManager.shared.getGamer(id: gamerId) { (gamerFound, gamer) in
//            self.gamer = gamer
//            // Check if user is Online
//            FIRDatabaseManager.shared.checkOnlineStatus(id: gamerId) { (isOnline) in
//                self.updateImageView(isOnline: isOnline)
//            }
//        }
//        
//    }
    
    func configurePlayer(player: Player) {
        self.gamerImageView.image = UIImage(data: player.img!)
    }
    
    func updateImageView(isOnline: Bool) {
        if isOnline {
            self.gamerImageView.tintColor = UIColor.green
            self.gamerImageView.image = UIImage(systemName: "person.fill")
        } else {
            self.gamerImageView.tintColor = UIColor.lightGray
            self.gamerImageView.image = UIImage(systemName: self.gamer.imageName)
        }
    }
    
    static let identifier = "GamerCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "GamerCollectionViewCell", bundle: nil)
    }
    
    

}

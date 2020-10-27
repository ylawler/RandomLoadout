//
//  friendsCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 26.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class friendsCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(friend: Player) {
        print("friend: \(String(describing: friend.id))")
    }
    
    
    static let identifier = "friendsCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "friendsCollectionViewCell", bundle: nil)
    }

}

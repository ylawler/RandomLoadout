//
//  NewSquadCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class NewSquadCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var squadImageView: UIImageView!
    
    @IBOutlet weak var squadNameTxtField: UITextField!
    @IBOutlet weak var addedUsersCollectionView: UICollectionView!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        /*
         id:
         image:
         name:
         players:
         */
        
        
    }
    
    static let identifier = "NewSquadCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewSquadCollectionViewCell", bundle: nil)
    }

}

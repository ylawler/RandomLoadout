//
//  addedCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 26.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class addedCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    static let identifier = "addedCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "addedCollectionViewCell", bundle: nil)
    }

}

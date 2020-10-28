//
//  HomeCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 28.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "HomeCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeCollectionViewCell", bundle: nil)
    }

}

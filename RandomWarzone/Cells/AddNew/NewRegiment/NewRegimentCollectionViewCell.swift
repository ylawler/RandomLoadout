//
//  NewRegimentCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class NewRegimentCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "NewRegimentCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewRegimentCollectionViewCell", bundle: nil)
    }

}

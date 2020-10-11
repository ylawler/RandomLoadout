//
//  PerksCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 09.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class PerksCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImageView.layer.masksToBounds = false
        backgroundImageView.layer.shadowColor = UIColor.darkGray.cgColor
        backgroundImageView.layer.shadowOffset = .zero
        backgroundImageView.layer.shadowRadius = 4
        backgroundImageView.layer.shadowOpacity = 0.75
        backgroundImageView.layer.cornerRadius = 12
    }
    
    static let identifier = "PerksCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "PerksCollectionViewCell", bundle: nil)
    }

}

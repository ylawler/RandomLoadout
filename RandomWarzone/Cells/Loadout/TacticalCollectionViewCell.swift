//
//  TacticalCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 12.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class TacticalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var tacticalName: UILabel!
    @IBOutlet weak var tacticalImageView: UIImageView!
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
    
    func configure(tactical: Tactical) {
        self.categoryLabel.text = "Tactical"
        self.tacticalName.text = tactical.name
        self.tacticalImageView.image = UIImage(named: tactical.imageName)
    }
    
    static let identifier = "TacticalCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "TacticalCollectionViewCell", bundle: nil)
    }
}

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
    @IBOutlet weak var perkOneImageView: UIImageView!
    @IBOutlet weak var perkTwoImageView: UIImageView!
    @IBOutlet weak var perkThreeImageView: UIImageView!
    
//    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var perkOneLabel: UILabel!
    @IBOutlet weak var perkTwoLabel: UILabel!
    @IBOutlet weak var perkThreeLabel: UILabel!
    
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
    
    func configure(perks: [Perk]) {
        let perkImageViews = [perkOneImageView, perkTwoImageView, perkThreeImageView]
        let perkLabels = [perkOneLabel, perkTwoLabel, perkThreeLabel]
        for i in 0..<perks.count {
            perkImageViews[i]?.image = UIImage(named: perks[i].imageName)
            perkLabels[i]?.text = perks[i].name
        }

    }
    
    static let identifier = "PerksCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "PerksCollectionViewCell", bundle: nil)
    }

}

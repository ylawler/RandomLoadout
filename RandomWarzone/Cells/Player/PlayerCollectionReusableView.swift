//
//  PlayerCollectionReusableView.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 21.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class PlayerCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerTitleBackground: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.headerTitleBackground.layer.cornerRadius = 3
        self.headerTitleBackground.createShadow(color: .black, radius: 5, opacity: 1)
    }
    
    func configure(title: String) {
        self.headerTitleLabel.text = title
    }
    
    static let identifier = "PlayerCollectionReusableViewId"
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayerCollectionReusableView", bundle: nil)
    }
    
}

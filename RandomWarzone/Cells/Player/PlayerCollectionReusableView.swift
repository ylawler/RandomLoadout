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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String) {
        self.headerTitleLabel.text = title
    }
    
    static let identifier = "PlayerCollectionReusableViewId"
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayerCollectionReusableView", bundle: nil)
    }
    
}

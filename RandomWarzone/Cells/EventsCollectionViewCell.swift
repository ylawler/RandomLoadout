//
//  EventsCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 26.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var eventTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundButton.isUserInteractionEnabled = false
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundButton.layer.cornerRadius = 12
        self.backgroundButton.layer.borderColor = darkTheme.cgColor
        self.backgroundButton.layer.borderWidth = 1
        self.backgroundButton.layer.shadowColor = UIColor.white.cgColor//darkTheme.cgColor
        self.backgroundButton.layer.shadowOffset = .zero
        self.backgroundButton.layer.shadowRadius = 4
        self.backgroundButton.layer.shadowOpacity = 1
    }
    
    static let identifier = "EventsCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "EventsCollectionViewCell", bundle: nil)
    }

}

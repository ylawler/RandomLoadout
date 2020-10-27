//
//  NewTitleCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class NewTitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
    }
    
    
    static let identifier = "NewTitleCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewTitleCollectionViewCell", bundle: nil)
    }

}

extension UIView {
    func createShadow(color: UIColor, radius: CGFloat, opacity: Float, offset: CGSize = .zero) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.clipsToBounds = true
    }
}

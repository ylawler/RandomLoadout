//
//  attachmentCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 09.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class attachmentCollectionViewCell: UICollectionViewCell {
    
    public let selectedColor: UIColor = UIColor(red: 252/255, green: 172/255, blue: 77/255, alpha: 1)
    
    @IBOutlet weak var attachmentSelectionImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(hasAttachment: Bool) {
        if hasAttachment {
            // Set selection Image to a filled circle
            self.attachmentSelectionImage.image = UIImage(systemName: "circle.fill")
        } else {
            self.attachmentSelectionImage.image = UIImage(systemName: "circle")
        }
    }
    
    static let identifier = "attachmentCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "attachmentCollectionViewCell", bundle: nil)
    }

}

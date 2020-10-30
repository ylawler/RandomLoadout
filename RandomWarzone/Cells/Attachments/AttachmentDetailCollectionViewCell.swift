//
//  AttachmentDetailCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 30.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class AttachmentDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var attachmentName: UILabel!
    @IBOutlet weak var attachment: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
    }
    
    func configure(attachment: String, attachmentName: String) {
        self.attachmentName.text = "\(attachment): "
        self.attachment.text = attachmentName
    }
    
    static let identifier = "AttachmentDetailCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "AttachmentDetailCollectionViewCell", bundle: nil)
    }

}

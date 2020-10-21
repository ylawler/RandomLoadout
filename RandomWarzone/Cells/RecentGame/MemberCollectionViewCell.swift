//
//  MemberCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 21.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class MemberCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var memberImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        self.memberImageView.layer.masksToBounds = false
        self.memberImageView.layer.cornerRadius = (self.frame.height - 16)/2
        self.memberImageView.layer.borderColor = darkTheme.cgColor
        self.memberImageView.layer.borderWidth = 1.5
        
        self.memberImageView.contentMode = .scaleAspectFit
        self.memberImageView.clipsToBounds = true
    }
    
    func configure(member: Friend) {
        self.memberImageView.image = UIImage(systemName: member.imageName)
    }
    
    static let identifier = "MemberCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "MemberCollectionViewCell", bundle: nil)
    }

}

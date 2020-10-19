//
//  WeaponCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 09.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class WeaponCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var weaponName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var weaponImageView: UIImageView!
    @IBOutlet weak var weaponClass: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var numAttachments: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(attachmentCollectionViewCell.nib(), forCellWithReuseIdentifier: attachmentCollectionViewCell.identifier)
        
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
    
    func configure(with weapon: weapon) {
        self.weaponName.text = weapon.name
        self.weaponClass.text = weapon.category
        self.weaponLabel.text = weapon.category
        self.numAttachments = weapon.setAttachments.count
        
        if let image = UIImage(named: weapon.imageName) {
            self.weaponImageView.image = image
        } 
        
    }
    
    static let identifier = "WeaponCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeaponCollectionViewCell", bundle: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: attachmentCollectionViewCell.identifier, for: indexPath) as! attachmentCollectionViewCell
        
        cell.configure(hasAttachment: (indexPath.item <= numAttachments - 1))
        
//        if indexPath.item <= numAttachments - 1 {
//            cell.configure(hasAttachment: true)
//        } else {
//            cell.configure(hasAttachment: false)
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.width/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

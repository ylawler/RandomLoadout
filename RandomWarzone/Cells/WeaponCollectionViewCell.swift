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
    @IBOutlet weak var weaponImageView: UIImageView!
    @IBOutlet weak var weaponClass: UILabel!
    
    var numAttachments: Int = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(attachmentCollectionViewCell.nib(), forCellWithReuseIdentifier: attachmentCollectionViewCell.identifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        weaponImageView.layer.masksToBounds = false
        weaponImageView.layer.shadowColor = UIColor.darkGray.cgColor
        weaponImageView.layer.shadowOffset = .zero
        weaponImageView.layer.shadowRadius = 4
        weaponImageView.layer.shadowOpacity = 0.75
        weaponImageView.layer.cornerRadius = 12
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

//
//  GameCollectionViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 09.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GameCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var LoadoutClass: Loadout?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(WeaponCollectionViewCell.nib(), forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier)
        self.collectionView.register(PerksCollectionViewCell.nib(), forCellWithReuseIdentifier: PerksCollectionViewCell.identifier)
        self.collectionView.register(LethalCollectionViewCell.nib(), forCellWithReuseIdentifier: LethalCollectionViewCell.identifier)
        self.collectionView.register(TacticalCollectionViewCell.nib(), forCellWithReuseIdentifier: TacticalCollectionViewCell.identifier)
        
        self.collectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let randomLoadoutClass = self.LoadoutClass {
            if indexPath.item == 0 {
                // Primary Weapon
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaponCollectionViewCell.identifier, for: indexPath) as! WeaponCollectionViewCell
                
                cell.configure(with: randomLoadoutClass.primaryWeapon)
                
                return cell
            } else if indexPath.item == 1 {
                // Secondary Weapon
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaponCollectionViewCell.identifier, for: indexPath) as! WeaponCollectionViewCell
                
                cell.configure(with: randomLoadoutClass.secondaryWeapon)
                return cell
                
            } else if indexPath.item == 2 {
                // Perks
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerksCollectionViewCell.identifier, for: indexPath) as! PerksCollectionViewCell
                
                cell.configure(perks: randomLoadoutClass.perks)
                
                return cell
                
            } else if indexPath.item == 3 {
                // Lethal
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LethalCollectionViewCell.identifier, for: indexPath) as! LethalCollectionViewCell
                cell.configure(lethal: randomLoadoutClass.lethal)
                return cell
                
            } else {
                // Tactical
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TacticalCollectionViewCell.identifier, for: indexPath) as! TacticalCollectionViewCell
                cell.configure(tactical: randomLoadoutClass.tactical)
                return cell
                
            }
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == 1 {
            return CGSize(width: collectionView.frame.width - 16, height: collectionView.frame.height * 0.25)
        } else if indexPath.item == 2 {
            return CGSize(width: collectionView.frame.width - 16, height: collectionView.frame.height * 0.175)
        } else {
            return CGSize(width: collectionView.frame.width - 16, height: collectionView.frame.height * 0.12)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

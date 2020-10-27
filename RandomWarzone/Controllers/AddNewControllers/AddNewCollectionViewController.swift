//
//  AddNewCollectionViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 24.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AddNewCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var newItem: String? {
        didSet {
            print("setting: \(newItem!)")
//            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(NewTitleCollectionViewCell.nib(), forCellWithReuseIdentifier: NewTitleCollectionViewCell.identifier)
        self.collectionView.register(NewPlayerCollectionViewCell.nib(), forCellWithReuseIdentifier: NewPlayerCollectionViewCell.identifier)
        self.collectionView.register(NewSquadCollectionViewCell.nib(), forCellWithReuseIdentifier: NewSquadCollectionViewCell.identifier)
        self.collectionView.register(NewRegimentCollectionViewCell.nib(), forCellWithReuseIdentifier: NewRegimentCollectionViewCell.identifier)
        
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
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch newItem {
            case "Player":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewPlayerCollectionViewCell.identifier, for: indexPath) as! NewPlayerCollectionViewCell
                
                
                // Configure the cell
                
                return cell
            case "Squad":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewSquadCollectionViewCell.identifier, for: indexPath) as! NewSquadCollectionViewCell
                
                
                // Configure the cell
                
                return cell
            case "Regiment":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewRegimentCollectionViewCell.identifier, for: indexPath) as! NewRegimentCollectionViewCell
                // Configure the cell
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                return cell
        }
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewTitleCollectionViewCell.identifier, for: indexPath) as! NewTitleCollectionViewCell
//            if let newItemTitle = self.newItem {
//                cell.titleLabel.text = "New \(newItemTitle)"
//            }
//
//            // Configure the cell
//
//            return cell
//        } else {
//
//
//
//
//        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.9)
        
//        if indexPath.section == 0 {
//            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height*0.05)
//        } else {
//            return CGSize(width: collectionView.frame.width, height:  collectionView.frame.height*0.95)
//        }
        
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

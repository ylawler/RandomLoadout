//
//  InvitesCollectionViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 26.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class InvitesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var sections = ["Regiments", "Squads", "Friends"]
    
    
    var regimentInvites: [Regiment]?
    var squadInvites: [Squad]?
    var playerInvites: [Player]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.register(PlayerCollectionViewCell.nib(), forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        self.collectionView.register(PlayerCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerCollectionReusableView.identifier)
        
        self.collectionView.alwaysBounceVertical = true

        
        
        // Do any additional setup after loading the view.
    }
    
    func setInvites(PlayerInvites: [Player]? = [], RegimentInvites: [Regiment]? = [], SquadInvitess: [Squad]? = []) {
        self.regimentInvites = RegimentInvites
        self.squadInvites = SquadInvitess
        self.playerInvites = PlayerInvites
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
        return sections.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            // Regiment
            if let regiments = regimentInvites {
                return regiments.count
            } else {
                return 0
            }
        case 1:
            // Squad
            if let squads = squadInvites {
                return squads.count
            } else {
                return 0
            }
        case 2:
            // Player
            if let players = playerInvites {
                return players.count
            } else {
                return 0
            }
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 96)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerCollectionReusableView.identifier, for: indexPath) as! PlayerCollectionReusableView
        headerView.configure(title: self.sections[indexPath.section])
        return headerView
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerHeight: CGFloat = 64
        return CGSize(width: collectionView.frame.width, height: headerHeight)
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

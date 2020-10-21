//
//  PlayerSelectionViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 19.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

struct Regiment {
    let name: String
    let members: [Friend]
    let imageName: String
}

struct Squad {
    let members: [Friend]
    let gamemode: String
    let imageName: String
}

struct Friend: Equatable {
    let name: String
    let desc: String
    let imageName: String
}


class PlayerSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var Regiments: [Regiment] = []
    var Squads: [Squad] = []
    var Friends: [Friend] = []
    
    let headerTitles = ["Regiments", "Recent Games", "Friends"]
    
    var selectedIndexItem: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.register(PlayerCollectionViewCell.nib(), forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        self.collectionView.register(PlayerCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerCollectionReusableView.identifier)
        
        //---------------------------------------------------------------------------------------------------
        // Hardcode some friends
        let Rich = Friend(name: "Rich", desc: "Yoooo you online tonight?", imageName: "person")
        let Chrizz = Friend(name: "Chrizz", desc: "Give me like 5 min...", imageName: "person")
        let Yannick = Friend(name: "Yannick", desc: "Not sure", imageName: "person")
        self.Friends = [Rich, Chrizz, Yannick]
        
        
        //---------------------------------------------------------------------------------------------------
        // Hardcode some Recent Squad Matches
        let recent1 = Squad(members: [Rich, Yannick], gamemode: "BR Duos", imageName: "person.2")
        let recent2 = Squad(members: [Chrizz, Yannick, Rich], gamemode: "BR Trios", imageName: "person.3")
        self.Squads = [recent1, recent2]
        
        
        //---------------------------------------------------------------------------------------------------
        // Hardcode some squads
        /// Team International
        let teamInternational = Regiment(name: "Team International 2020", members: [Rich, Yannick, Chrizz], imageName: "person.2.fill")
        self.Regiments = [teamInternational]
        
        
        self.collectionView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRecentGame" {
            let dest = segue.destination as! RecentGameViewController
            dest.recentGame = self.Squads[selectedIndexItem]
            
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headerTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.Regiments.count
        case 1:
            return self.Squads.count
        case 2:
            return self.Friends.count
        default:
            return 0
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.configureRegiment(regiment: self.Regiments[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.configureSquad(squad: self.Squads[indexPath.item])
        return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.configureFriend(friend: self.Friends[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerCollectionReusableView.identifier, for: indexPath) as! PlayerCollectionReusableView
        headerView.configure(title: self.headerTitles[indexPath.section])
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexItem = indexPath.item
        if indexPath.section == 1 {
            // Selected Recent Game
            self.performSegue(withIdentifier: "showRecentGame", sender: self)
        }
        
        
    }

}

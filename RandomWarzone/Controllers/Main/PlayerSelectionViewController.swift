//
//  PlayerSelectionViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 19.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth



class PlayerSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var newItemButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    
    let headerTitles = ["Regiments", "Favorites", "Friends"]
    
    var selectedIndexItem: Int = 0
    
    var ref: DatabaseReference?
    
    var playerIds: [String] = []
    var players: [Player] = []
    var squads: [Squad] = []
    var regiments: [Regiment] = []
    
    
    let uid = "user1Id"
    let CDM = CoreDataManager()
    var FDM: FIRDatabaseManager?
    
    var newItem = "nill"
    
    var squadInvites: [Squad] = []
    var regimentInvites: [Regiment] = []
    var playerInvites: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForUserAndLoadData()
        
//        // Add listener to firebase for invitations
//        FDM?.observeForInvites { (inviteFound) in
//            if inviteFound {
//                print("INVITES FOUND")
//            }
//        }
        
        self.notificationButton.tintColor = .orange
        
        
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.register(PlayerCollectionViewCell.nib(), forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        self.collectionView.register(PlayerCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlayerCollectionReusableView.identifier)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.checkForUserAndLoadData()
//        self.refreshData()
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "searchNewSegue" {
            let dest = segue.destination as! AddNewItemViewController
            dest.searchCriteria = newItem
            dest.FDM = self.FDM
        } else if segue.identifier == "addNewItemSegue" {
            let dest = segue.destination as! AddNewCollectionViewController
            dest.newItem = newItem
        } else if segue.identifier == "addNewSquadSegue" {
            let dest = segue.destination as! AddNewSquadViewController
            dest.Friends = self.players
            dest.FDM = self.FDM
            //            dest.newItem = newItem
        } else if segue.identifier == "showInviteSegue" {
            let dest = segue.destination as! InvitesCollectionViewController
            dest.setInvites(PlayerInvites: self.playerInvites, RegimentInvites: self.regimentInvites, SquadInvitess: self.squadInvites)
        }
        
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return headerTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.regiments.count
        case 1:
            return self.squads.count
        case 2:
            return self.players.count
        default:
            return 0
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.configure(regiment: self.regiments[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.configure(squad: self.squads[indexPath.item])
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
//            cell.delegate = self
//            cell.item = indexPath.item
//            cell.configureWithId(id: self.playerIds[indexPath.item], databaseManager: self.FDM!, CDM: self.CDM)
            
            cell.configure(player: self.players[indexPath.item])
//            cell.configureWithId(id: self.playerIds[indexPath.item], databaseManager: self.FDM!, CDM: self.CDM)
//            cell.configureWithId(id: self.playerIds[indexPath.item], databaseManager: self.FDM!, CDM: self.CDM)
            
            
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
        let headerHeight: CGFloat = 64
        
        return CGSize(width: collectionView.frame.width, height: headerHeight)
        
        //        switch section {
        //        case 0:
        //            if self.regiments.count == 0 {
        //                return .zero
        //            } else {
        //                return CGSize(width: collectionView.frame.width, height: headerHeight)
        //            }
        //        case 1:
        //            if self.squads.count == 0 {
        //                return .zero
        //            } else {
        //                return CGSize(width: collectionView.frame.width, height: headerHeight)
        //            }
        //        case 2:
        //            if self.players.count == 0 {
        //                return .zero
        //            } else {
        //                return CGSize(width: collectionView.frame.width, height: headerHeight)
        //            }
        //        default:
        //            return .zero
        //        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexItem = indexPath.item
        
        
        switch indexPath.section {
        case 0:
            // Selected Regiment
            self.performSegue(withIdentifier: "showRegimentSegue", sender: self)
        case 1:
            // Selected Favorite
            self.performSegue(withIdentifier: "showFavoriteSegue", sender: self)
        case 2:
            // Selected Friend
            self.performSegue(withIdentifier: "showFriendSegue", sender: self)
        default:
            return
        }
    }
    
    @IBAction func leftBarButtonTapped(_ sender: UIBarButtonItem) {
        FIRAuthManager.shared.signOutUser { (signOutSuccessful) in
            if signOutSuccessful {
                self.clearData()
                self.checkForUserAndLoadData()
            }
        }
    }
    
    func clearData() {
        self.FDM = nil
        self.CDM.deleteAll()
        self.players = []
        self.regiments = []
        self.squads = []
        self.collectionView.reloadData()
    }
    
    
    @IBAction func newItemButtonTapped(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        alertController.addAction(UIAlertAction(title: "Regiment", style: .default, handler: { (action) in
            print("ADD NEW REGIMENT")
            self.newItem = "Regiment"
            self.performSegue(withIdentifier: "addNewItemSegue", sender: self)
        }))
        
        alertController.addAction(UIAlertAction(title: "Squad", style: .default, handler: { (action) in
            print("ADD NEW SQUAD")
            self.newItem = "Squad"
            self.performSegue(withIdentifier: "addNewSquadSegue", sender: self)
        }))
        
        alertController.addAction(UIAlertAction(title: "Friend", style: .default, handler: { (action) in
            print("ADD NEW PLAYER")
            self.newItem = "Player"
            self.performSegue(withIdentifier: "searchNewSegue", sender: self)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel")
        }))
        
        self.present(alertController, animated: true)
        
    }
    
    @IBAction func notificationBarButtonTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showInviteSegue", sender: self)
    }
    
    
    func filterExistingData(playersToFilter: [Player]? = nil, regimentsToFilter: [Regiment]? = nil, squadsToFilter: [Squad]? = nil) {
        if playersToFilter != nil {
            print(playersToFilter!)
            for player in playersToFilter! {
                if !self.players.contains(player) {
                    self.players.append(player)
                }
            }
        } else if regimentsToFilter != nil {
            print(regimentsToFilter!)
            for regiment in regimentsToFilter! {
                if !self.regiments.contains(regiment) {
                    self.regiments.append(regiment)
                }
            }
        } else if squadsToFilter != nil {
            print(squadsToFilter!)
            for squad in squadsToFilter! {
                if !self.squads.contains(squad) {
                    self.squads.append(squad)
                }
            }
        }
    }
    
    fileprivate func loadSquads() {
        self.FDM?.loadPlayerSquads(CDM: self.CDM) { (playerSquadsFound, squads) in
            if playerSquadsFound {
                self.addToSquads(Squads: squads)
                self.collectionView.reloadData()
            } else {
                print("REFRESH DATA: NO SQUADS FOUND")
            }
        }
    }
    
    fileprivate func loadRegiments() {
        self.FDM?.loadPlayerRegiments(CDM: self.CDM) { (playerRegimentsFound, regiments) in
            if playerRegimentsFound {
                self.addToRegiments(Regiments: regiments)
                self.collectionView.reloadData()
            } else {
                print("REFRESH DATA: NO REGIMENTS FOUND")
            }
        }
    }
    
    fileprivate func loadFriends() {
        FDM?.loadPlayerFriendIds(CDM: self.CDM) { (playerFriendIdsLoaded, players) in
            if playerFriendIdsLoaded {
                self.addToPlayers(Players: players)
                self.collectionView.reloadData()
            } else {
                print("REFRESH DATA: NO PLAYERS FOUND")
            }
        }
    }
    
    func refreshData() {
        loadFriends()
        loadSquads()
        loadRegiments()
    }
    
    func addToPlayers(Players: [Player]) {
        for player in Players {
            if !self.players.contains(player) {
                self.players.append(player)
            }
        }
    }
    
    func addToRegiments(Regiments: [Regiment]) {
        for regiment in Regiments {
            if !self.regiments.contains(regiment) {
                self.regiments.append(regiment)
            }
        }
    }
    
    func addToSquads(Squads: [Squad]) {
        for squad in Squads {
            if !self.squads.contains(squad) {
                self.squads.append(squad)
            }
        }
    }
    
    
    fileprivate func checkForUserAndLoadData() {
        FIRAuthManager.shared.checkForUser { (userExists, user) in
            if userExists {
                if let _ = self.FDM {
                    self.loadCoreData()
                } else {
                    self.FDM = FIRDatabaseManager(uid: user!.uid)
                    self.loadCoreData()
                    
                }
                self.refreshData()
                
            } else {
                self.performSegue(withIdentifier: "showLoginSegue", sender: self)
            }
            
        }
    }
    
    func loadCoreData() {
        self.CDM.loadCoreData { (successful, Players, Squads, Regiments) in
            if successful {
                self.addToPlayers(Players: Players!)
                self.addToSquads(Squads: Squads!)
                self.addToRegiments(Regiments: Regiments!)
                
            }
        }
    }
    
    
}

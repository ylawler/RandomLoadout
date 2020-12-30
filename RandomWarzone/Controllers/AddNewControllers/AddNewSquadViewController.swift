//
//  AddNewSquadViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 26.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class AddNewSquadViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var addNameTextField: UITextField!
    
    @IBOutlet weak var addedColletionView: UICollectionView!
    
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    var selectedFriends: [Player] = []
    var Friends: [Player]?
    
    var selectedIndexPaths: [IndexPath] = []
    
    var FDM: FIRDatabaseManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardOnTap()
        
        
        if let friends = self.Friends {
            print("FRIENDS: \(friends)")
        }
        
        self.addImageButton.layer.cornerRadius = self.addImageButton.frame.height/2
        self.addImageButton.layer.borderColor = darkTheme.cgColor
        self.addImageButton.layer.borderWidth = 1
//        self.addImageButton.image = UIImage(systemName: "camera")
        
        
        self.addedColletionView.delegate = self
        self.friendsCollectionView.delegate = self
        self.addedColletionView.dataSource = self
        self.friendsCollectionView.dataSource = self
        
        self.addedColletionView.alwaysBounceHorizontal = true
        self.friendsCollectionView.alwaysBounceVertical = true
        
        
        
        self.addedColletionView.register(addedCollectionViewCell.nib(), forCellWithReuseIdentifier: addedCollectionViewCell.identifier)
        self.friendsCollectionView.register(PlayerCollectionViewCell.nib(), forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case addedColletionView:
            return self.selectedFriends.count
        case friendsCollectionView:
            
            if let friends = self.Friends {
                return friends.count
            } else {
                return 1
            }
            
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case addedColletionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addedCollectionViewCell.identifier, for: indexPath) as! addedCollectionViewCell
            return cell
        case friendsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            
            
            
//            if let friends = self.Friends {
//                cell.configure(friend: friends[indexPath.item])
//                cell.configure(player: friends[indexPath.item])
//            }
            
            if self.selectedIndexPaths.contains(indexPath) {
                // cell is a selected one
                cell.backgroundColor = .yellow
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case addedColletionView:
            return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
        case friendsCollectionView:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/8)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case addedColletionView:
            return 0
        case friendsCollectionView:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // selected friend at indexPath.item, add to selelcted Friends and reload colelctionviews
        if let friends = self.Friends {
            let selectedFriend = friends[indexPath.item]
            self.selectedFriends.append(selectedFriend)
            self.selectedIndexPaths.append(indexPath)
            self.addedColletionView.reloadData()
            self.friendsCollectionView.reloadData()
        }
    }
    
    
    @IBAction func createButtonTapped(_ sender: UIBarButtonItem) {
        
        // if all conditions met, create a squad. Name, id, and list of players
        print("Create Squad: \(self.addNameTextField.text)")
        
        if self.addNameTextField.text != "" {
            
            let squadImageName = "person.2"//: UIImage = UIImage(systemName: "person.2")!
    
            guard let FirebaseDatabaseManager = self.FDM else { return }
            
            //  Create Squad in core data and add to firebase
            FirebaseDatabaseManager.createSquadInFirebase(squadName: self.addNameTextField.text!, squadImageName: squadImageName, players: self.selectedFriends)
            
//            FirebaseDatabaseManager.createNewSquad(squadName: self.addNameTextField.text!, squadImageName: squadImageName, squadPlayers: self.selectedFriends)

            
            self.navigationController?.popToRootViewController(animated: true)

            
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

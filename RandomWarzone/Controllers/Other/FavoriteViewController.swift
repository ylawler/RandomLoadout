//
//  FavoriteViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 22.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FavoriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var gamersCollectionView: UICollectionView!
    @IBOutlet weak var readyButton: UIButton!
    
    var RandomLoadout: Loadout?
    var gamers: [Gamer] = []
    
    var ref: DatabaseReference?
    
    
    var Favorite: Squad? {
        didSet {
            self.navigationItem.title = Favorite?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        readyButton.layer.cornerRadius = 100
        readyButton.layer.borderWidth = 1
        readyButton.layer.borderColor = UIColor.lightGray.cgColor
        readyButton.createShadow()
        
        // Do any additional setup after loading the view.
        
        
        gamersCollectionView.delegate = self
        gamersCollectionView.dataSource = self
        gamersCollectionView.register(GamerCollectionViewCell.nib(), forCellWithReuseIdentifier: GamerCollectionViewCell.identifier)
        gamersCollectionView.alwaysBounceHorizontal = true
//        gamersCollectionView.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
        
        // View opened, so set own status to online, and listen for other
        
        
//        ref = Database.database().reference()
//        ref?.child("Users").observe(.childChanged) { (changedSnapshot) in
//            let userDict = changedSnapshot.value as! NSDictionary
//
//            guard let favorite = self.Favorite else { return }
//
////            if favorite.gamerIds.contains(changedSnapshot.key) {
////                print("user: \(changedSnapshot.key) isOnline: \(userDict["isOnline"] as! Bool)")
////                self.gamersCollectionView.reloadData()
////            }
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ref?.child("Users").removeAllObservers()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showGameSegue" {
            let dest = segue.destination as! GameCollectionViewController
            if let randomLoadout = self.RandomLoadout {
                dest.LoadoutClass = randomLoadout
                self.RandomLoadout = nil
            }
        }
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let favorite = self.Favorite {
            return 0//favorite.gamerIds.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GamerCollectionViewCell.identifier, for: indexPath) as! GamerCollectionViewCell
        
//        if let favorite = self.Favorite?.gamerIds {
//            cell.configure(gamerId: favorite[indexPath.item])
//        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    @IBAction func readyButtonTapped(_ sender: UIButton) {
        self.RandomLoadout = RandomManager().createRandomLoadout()
        self.performSegue(withIdentifier: "showGameSegue", sender: self)
    }
    
    
}



extension UIButton {
    func createShadow() {
        self.layer.shadowColor = UIColor.white.cgColor//darkTheme.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.8
    }
}

//
//  RecentGameViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 21.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class RecentGameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var membersCollectionView: UICollectionView!
    
    
    var RandomLoadout: Loadout?
    
    var recentGame: Squad? {
        didSet {
            self.navigationItem.title = recentGame?.gamemode
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.shuffleButton.layer.cornerRadius = 12
        
        membersCollectionView.delegate = self
        membersCollectionView.dataSource = self
        membersCollectionView.register(MemberCollectionViewCell.nib(), forCellWithReuseIdentifier: MemberCollectionViewCell.identifier)
        self.membersCollectionView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.membersCollectionView.reloadData()
//    }
    
    
    
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
 
    @IBAction func shuffleTapped(_ sender: UIButton) {
        self.RandomLoadout = RandomManager().createRandomLoadout()
        self.performSegue(withIdentifier: "showGameSegue", sender: self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let recentGame = self.recentGame {
            return recentGame.members.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCollectionViewCell.identifier, for: indexPath) as! MemberCollectionViewCell
        
        if let recentGame = self.recentGame {
            cell.configure(member: recentGame.members[indexPath.item])
        }
        
        
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
    
}

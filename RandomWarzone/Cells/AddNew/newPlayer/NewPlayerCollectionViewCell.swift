//
//  NewPlayerCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class NewPlayerCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let players = ["Rich", "Yannick", "Chrizz", "Monte", "Arne"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewId")
        
        /*
         
         
         
         
         
         
         */
    }
    
    static let identifier = "NewPlayerCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewPlayerCollectionViewCell", bundle: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewId", for: indexPath)
        
        
        return cell
    }

}

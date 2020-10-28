//
//  AddNewItemViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

public struct searchResult: Equatable {
    let id: String
    let name: String
    let imageName: String
    var friendStatus: String
    
}



class AddNewItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, friendButtonDelegate {
    
    
    
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var searchResults: [searchResult] = []
    
    var searchCriteria: String? {
        didSet {
            print("Searching for: New \(searchCriteria!)")
        }
    }
    
    var FDM: FIRDatabaseManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(SearchResultTableViewCell.nib(), forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        searchTextField.delegate = self
        
        self.hideKeyboardOnTap()
        self.tableView.allowsMultipleSelection = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.searchTextField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var searchText = textField.text!
        
        if string != "" {
            searchText += string
        } else {
            searchText.removeLast()
        }
        
        print("searching for: \(searchText) -> textField.text: \(textField.text!), replacementString: \(string)")
        
        if let databaseManager = self.FDM {
            databaseManager.searchUsersFor(username: searchText) { (searchCompleted, Results) in
                if searchCompleted {
                    guard let results = Results else { return }
                    self.searchResults = results
                    self.tableView.reloadData()
                }
                
                
            }
            self.tableView.reloadData()
        }
        
        
        
        return true
    }
    
    func displayAlert(alertController: UIAlertController) {
        self.present(alertController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as! SearchResultTableViewCell
        cell.DatabaseManager = self.FDM
        cell.delegate = self
        cell.configure(searchResult: self.searchResults[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}

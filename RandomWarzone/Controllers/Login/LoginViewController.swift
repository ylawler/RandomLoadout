//
//  LoginViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, loginButtonDelegate, signUpButtonDelegate {

    @IBOutlet weak var titleBackground: UIImageView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let segmentOptions = ["Login", "Sign Up"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardOnTap()

        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.alwaysBounceHorizontal = false
        self.collectionView.register(LoginCollectionViewCell.nib(), forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
        self.collectionView.register(SignUpCollectionViewCell.nib(), forCellWithReuseIdentifier: SignUpCollectionViewCell.identifier)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightText]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    func loginUser(email: String, password: String) {
        FIRAuthManager.shared.signInUser(with: email, password: password) { (successful, user) in
            if successful {
                // successful sign in
                
                if let presenter = self.presentingViewController as? PlayerSelectionViewController {
//                    presenter.FDM = FIRDatabaseManager(user: user!)
                }
                
                self.dismiss(animated: true) {
                    print("Login Dismissed")
                }
            }
        }
    }
    
    func signUpUser(email: String, username: String, password: String) {
        FIRAuthManager.shared.signUpUser(with: email, username: username, password: password) { (successful, appManager) in
            if successful {
                /*
                 We have a successful login
                 
                 - created user in Database and signed in
                 
                 // TODO: performSegue to app
                 
                 */
                
                
                
                if let presenter = self.presentingViewController as? PlayerSelectionViewController {
                    presenter.appManager = appManager
                }
                
                self.dismiss(animated: true) {
                    print("Login Dismissed")
                }
            }
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

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            // Case of Login User
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath) as! LoginCollectionViewCell
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpCollectionViewCell.identifier, for: indexPath) as! SignUpCollectionViewCell
            cell.delegate = self
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        print("selected: \(sender.selectedSegmentIndex) -> \(segmentOptions[sender.selectedSegmentIndex])")
        self.collectionView.scrollToItem(at: IndexPath(item: 0, section: sender.selectedSegmentIndex), at: .centeredHorizontally, animated: true)
//        self.collectionView.reloadData()
    }
    
    
    
    
}

extension UIViewController {
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

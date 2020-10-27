//
//  LoginCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell  {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: loginButtonDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loginButton.layer.cornerRadius = 16
        loginButton.createShadow(color: .darkGray, radius: 3, opacity: 0.75)
    }
    
    static let identifier = "LoginCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "LoginCollectionViewCell", bundle: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if self.usernameTextField.text != "" && self.passwordTextField.text != "" {
            if let del = self.delegate {
                del.loginUser(email: self.usernameTextField.text!, password: self.passwordTextField.text!)
            }
        } else {
            print("Please enter a valid username and password")
        }
    }
    
}


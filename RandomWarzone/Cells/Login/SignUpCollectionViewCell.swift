//
//  SignUpCollectionViewCell.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class SignUpCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var delegate: signUpButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        signUpButton.createShadow(color: .black, radius: 3, opacity: 1)
        signUpButton.layer.cornerRadius = 16
        
    }
    
    static let identifier = "SignUpCollectionViewCellId"
    
    static func nib() -> UINib {
        return UINib(nibName: "SignUpCollectionViewCell", bundle: nil)
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        if self.usernameTextField.text != "" && self.emailTextField.text != "" && self.passwordTextField.text != "" && self.passwordTextField.text == self.confirmTextField.text {
            
            if let del = self.delegate {
                del.signUpUser(email: self.emailTextField.text!, username: self.usernameTextField.text!, password: self.passwordTextField.text!)
            }
            
        }
    }
    
}

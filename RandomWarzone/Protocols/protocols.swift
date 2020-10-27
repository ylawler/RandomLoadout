//
//  protocols.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit


protocol loginButtonDelegate {
    func loginUser(email: String, password: String)
}

protocol signUpButtonDelegate {
    func signUpUser(email: String, username: String, password: String)
}

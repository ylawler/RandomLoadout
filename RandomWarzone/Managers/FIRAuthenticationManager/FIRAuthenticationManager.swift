//
//  FIRAuthenticationManager.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 25.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FIRAuthManager {
    
    static let shared = FIRAuthManager()
    
    var ref: DatabaseReference!
    
    func checkForUser(completion: (Bool, User?) -> Void) {
        if Auth.auth().currentUser != nil {
            // we have a user
            completion(true, Auth.auth().currentUser!)
        } else {
            completion(false, nil)
        }
    }
    
    func signOutUser(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let err {
            print("error signing out: \(err)")
            completion(false)
        }
    }
    
    func signInUser(with email: String, password: String, completion: @escaping (Bool, User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (AuthDataResult, err) in
            if err != nil {
                print("Error creating user: \(err!)")
                completion(false, nil)
            } else {
                // sign in successful
                
                // TODO : Any further things to do here...
                
                completion(true, AuthDataResult!.user)
            }
        }
    }
    
    func signUpUser(with email: String, username: String, password: String, completion: @escaping (Bool, AppManager) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (AuthResult, err) in
            if err != nil {
                print("Error creating user: \(err!)")
//                completion(false, nil)
            } else {
                
                if let authResult = AuthResult {
                    print("USER CREATED: \(String(describing: authResult.user.email))")
                    
                    // INitialize Database Manager
//                    let FDBM = FIRDatabaseManager(uid: authResult.user.uid)
                    let appManager = AppManager(uid: authResult.user.uid)
                    
                    // Create user entry in Fireabse Database
//                    FDBM.addNewUser(id: authResult.user.uid, username: username, email: email)
                    
                    // We have a successfully signed up
                    // Create a Me object
                    
                    
                    completion(true, appManager)
                }
            }
        }
    }
}

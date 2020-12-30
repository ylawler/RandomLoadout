//
//  AppManager.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 07.11.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import Firebase
import CoreData


// V.2 - combining CoreData and Firebase managers into 1
//     -> reason: constant passing of coreData Context and databaseManagers

struct UserStruct {
    let id: String
    let username: String
    let imageName: String
    let email: String
}

class AppManager {
    
    var ref: DatabaseReference!
    var user: UserStruct?
    
    let coreDataManager = CoreDataManager()
    var DatabaseManager: FIRDatabaseManager?
    
    init(uid: String) {
        // initialize user struct
        
        // Initialize userStruct
        self.initUserStruct(uid: uid) { (successfull, userStruct) in
            if successfull {
                self.user = userStruct
                self.DatabaseManager = FIRDatabaseManager(user: userStruct)
                self.initNewUserInFirebase()
            }
        }
    }
    
    func initUserStruct(uid: String, completion: @escaping (Bool, UserStruct) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(uid)").observeSingleEvent(of: .value) { (Snapshot) in
            if let userDict = Snapshot.value as? NSDictionary {
                let username = userDict["username"] as! String
                let imageName = userDict["imageName"] as! String
                let email = userDict["email"] as! String
                let userStruct = UserStruct(id: uid, username: username, imageName: imageName, email: email)
                completion(true, userStruct)
            }
        }
    }

    
    func initNewUserInFirebase() {
        guard let user = self.user else { return }
        
        ref = Database.database().reference()
        let userRef = ref.child("Users").child(user.id)
        userRef.child("username").setValue(user.username)
        userRef.child("imageName").setValue(user.imageName)
        userRef.child("email").setValue(user.email)
        userRef.child("isOnline").setValue(true)
    }
    
    // TODO:
    func loadSquads() {
        // Get firebaseIds
        guard let databaseManager = self.DatabaseManager else { return }
        databaseManager.getFirebaseIds(forKey: "Favorites") { (successful, squadIds) in
            if successful {
                // We have favorite squads
                for squadId in squadIds {
                    // Check if squad Exists
                    if !self.coreDataManager.checkIfExists(id: squadId, entityName: "Squad") {
                        databaseManager.getData(forKey: "Squads", forId: squadId) { (found, structData) in
                            if found {
                                self.coreDataManager.save(entityName: "Squad", structData: structData!)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func loadRegiments() {
        guard let databaseManager = self.DatabaseManager else { return }
        databaseManager.getFirebaseIds(forKey: "Regiments") { (successful, regimentIds) in
            if successful {
                for regimentId in regimentIds {
                    if !self.coreDataManager.checkIfExists(id: regimentId, entityName: "Regiment") {
                        databaseManager.getData(forKey: "Regiments", forId: regimentId) { (found, regimentStruct) in
                            if found {
                                self.coreDataManager.save(entityName: "Regiment", structData: regimentStruct!)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}





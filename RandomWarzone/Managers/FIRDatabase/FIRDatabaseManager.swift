//
//  FIRDatabaseManager.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 21.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth

public struct squadStruct {
    let id: String
    let name: String
    let imageName: String
    let players: [String: Bool]
}

public struct regimentStruct {
    let id: String
    let name: String
    let imageName: String
    let players: [String: Bool]
}

public struct StructData {
    let id: String
    let name: String
    let imageName: String
    let players: [String: Bool]
}

public struct friendStruct {
    let id: String
    let name: String
    let imageName: String
    let players: [String: Bool]
}


class FIRDatabaseManager {
//    static let shared = FIRDatabaseManager()
    
    var ref: DatabaseReference!
    var user: UserStruct
    
    init(user: UserStruct) {
        self.user = user
    }
    
    func getPlayer(forId: String, completion: @escaping (Bool, friendStruct?) -> Void) {
        
    }
    
    func getData(forKey: String, forId: String, completion: @escaping (Bool, StructData?) -> Void) {
        ref = Database.database().reference()
        ref.child("\(forKey)/\(forId)").observeSingleEvent(of: .value) { (Snapshot) in
            if let SnapDict = Snapshot.value as? NSDictionary {
                let imageName = SnapDict["imageName"] as! String
                let name = SnapDict["name"] as! String
                var players: [String: Bool] = [:]
                if let PlayersDict = SnapDict["Players"] as? NSDictionary {
                    
                    // We have players
                    
                    
                    print("\(name) - SQUAD - with players:")
                    let allPlayerIds = PlayersDict.allKeys as! [String]
                    for playerId in allPlayerIds {
                        let PlayerDict = PlayersDict[playerId] as! NSDictionary
                        let isReady = PlayerDict["isReady"] as! Bool
                        players.updateValue(isReady, forKey: playerId)
                        print("player: \(playerId) -> isReady: \(isReady)")
                    }
                }
                
                // Create a temporary squad struct
//                let tmpSquad = squadStruct(id: forId, name: name, imageName: imageName, players: players)
                
                let tmpStruct = StructData(id: forId, name: name, imageName: imageName, players: players)
                
                completion(true, tmpStruct)
                
            } else {
                completion(false, nil)
            }
        }
    }
    
//    func getSquad(forId: String, completion: @escaping (Bool, squadStruct?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Squads/\(forId)").observeSingleEvent(of: .value) { (SquadSnapshot) in
//            if let SquadDict = SquadSnapshot.value as? NSDictionary {
//                let imageName = SquadDict["imageName"] as! String
//                let name = SquadDict["name"] as! String
//                var players: [String: Bool] = [:]
//                if let PlayersDict = SquadDict["Players"] as? NSDictionary {
//
//                    // We have players
//
//
//                    print("\(name) - SQUAD - with players:")
//                    let allPlayerIds = PlayersDict.allKeys as! [String]
//                    for playerId in allPlayerIds {
//                        let PlayerDict = PlayersDict[playerId] as! NSDictionary
//                        let isReady = PlayerDict["isReady"] as! Bool
//                        players.updateValue(isReady, forKey: playerId)
//                        print("player: \(playerId) -> isReady: \(isReady)")
//                    }
//                }
//
//                // Create a temporary squad struct
//                let tmpSquad = squadStruct(id: forId, name: name, imageName: imageName, players: players)
//
//                completion(true, tmpSquad)
//
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
    
    func getFirebaseIds(forKey: String, completion: @escaping (Bool, [String]) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)").child(forKey).observeSingleEvent(of: .value) { (Snapshot) in
            if let snapDict = Snapshot.value as? NSDictionary {
                let ids = snapDict.allKeys as! [String]
                completion(true, ids)
            } else {
                completion(false, [])
            }
        }
    }
    
//    func getFirebaseFriendIds(completion: @escaping (Bool, [String]) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(self.userId)/Friends").observeSingleEvent(of: .value) { (squadIdSnapshot) in
//            if let squadIdsDict = squadIdSnapshot.value as? NSDictionary {
//                let squadIds = squadIdsDict.allKeys as! [String]
//                completion(true, squadIds)
//            } else {
//                completion(false, [])
//            }
//        }
//    }
//
//    func getFirebaseSquadIds(completion: @escaping (Bool, [String]) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(self.userId)/Favorites").observeSingleEvent(of: .value) { (squadIdSnapshot) in
//            if let squadIdsDict = squadIdSnapshot.value as? NSDictionary {
//                let squadIds = squadIdsDict.allKeys as! [String]
//                completion(true, squadIds)
//            } else {
//                completion(false, [])
//            }
//        }
//    }
    
    
    
    func createSquadInFirebase(squadName: String, squadImageName: String, players: [Player]?) {
        ref = Database.database().reference()
        let squadRef = ref.child("Squads").childByAutoId()
        squadRef.child("imageName").setValue(squadImageName)
        squadRef.child("name").setValue(squadName)
        
        if let Players = players {
            for player in Players {
                squadRef.child("Players").child(player.id!).child("isReady").setValue(false)
                squadRef.child("Players").child(player.id!).child("accepted").setValue(false)
                
            }
        }
        ref.child("Users/\(self.user.id)/Favorites").child(squadRef.key!).setValue(0)
        
        
    }
    
    func sendSquadInvite(toId: String, squad: Squad) {
        // Create Favorites for toId
        let squadIdref = ref.child("Users\(toId)/Favorites").child(squad.id!)
        squadIdref.child("imageName").setValue("person.3")
        squadIdref.child("name").setValue(squad.name!)
        
    }
    
    func getProfileForTitleView(completion: @escaping (Bool, String?, String?) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)").observeSingleEvent(of: .value) { (DataSnapshot) in
            if let DataDict = DataSnapshot.value as? NSDictionary {
                // get name and imageName
                let username = DataDict["username"] as! String
                let imageName = DataDict["imageName"] as! String
//                self.username = username
//                self.imageName = imageName
                completion(true, username, imageName)
            } else {
                completion(false, nil, nil)
            }
        }
    }
    
//    func addObserverForOnlineFriends() {
//        ref = Database.database().reference()
////        ref.child(<#T##pathString: String##String#>)
//    }
    
    
//    func savePlayerDetails(playerId: String, CDM: CoreDataManager, completion: @escaping (Bool, Player?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(playerId)").observeSingleEvent(of: .value) { (PlayerSnapshot) in
//            if let playerDict = PlayerSnapshot.value as? NSDictionary {
//                let username = playerDict["username"] as! String
//                let isOnline = playerDict["isOnline"] as! Bool
//                let imageName = playerDict["imageName"] as! String
//
//                if !CDM.checkIfExists(id: playerId, entityName: "Player") {
//                    self.savePlayerObject(for: CDM.context, id: playerId, img: (UIImage(systemName: imageName)?.pngData())!, name: username, isOnline: isOnline, isReady: false) { (successfull, player, err) in
//                        if let er = err {
//                            print(er)
//                            completion(false, nil)
//                        } else {
//                            // Got player
//                            completion(true, player!)
//                        }
//                    }
//                }
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
    
    
    func acceptFriendRequest(from: searchResult) {
        // Add into Friends
        ref.child("Users/\(self.user.id)/Friends").child(from.id).child("name").setValue(from.name)
        ref.child("Users/\(self.user.id)/Friends").child(from.id).child("imageName").setValue(from.imageName)
        ref.child("Users/\(self.user.id)/Friends").child(from.id).child("isOnline").setValue(false)
        ref.child("Users/\(self.user.id)/Friends").child(from.id).child("isReady").setValue(false)
        
        ref.child("Users/\(from.id)/Friends").child(self.user.id).child("name").setValue(self.user.username)
        ref.child("Users/\(from.id)/Friends").child(self.user.id).child("imageName").setValue(self.user.imageName)
        ref.child("Users/\(from.id)/Friends").child(self.user.id).child("isOnline").setValue(false)
        ref.child("Users/\(from.id)/Friends").child(self.user.id).child("isReady").setValue(false)
        
        
        // Remove the requests
        ref.child("Users/\(from.id)/Invites/Sent").child(self.user.id).removeValue()
        ref.child("Users/\(self.user.id)/Invites/Received").child(from.id).removeValue()
        
        
        // create Player object for new friend
        
        
    }
    
    func removeFriendRequest(to uid: String) {
        ref = Database.database().reference()
        ref.child("Users/\(uid)/Invites/Received/\(self.user.id)").removeValue()
        ref.child("Users/\(self.user.id)/Invites/Sent/\(uid)").removeValue()
    }
    
    func sendFriendRequest(to uid: String) {
        ref = Database.database().reference()
        ref.child("Users/\(uid)/Invites/Received").child(self.user.id).setValue(0)
        ref.child("Users/\(self.user.id)/Invites/Sent").child(uid).setValue(0)
    }
    
    func searchUsersFor(username: String, completion: @escaping (Bool, [searchResult]?) -> Void) {
        ref = Database.database().reference()
        ref.child("Users").observeSingleEvent(of: .value) { (UserSnapshot) in
            if let UsersDict = UserSnapshot.value as? NSDictionary {
                let allIds = UsersDict.allKeys as! [String]
                
                var results: [searchResult] = []
                
                
                for id in allIds {
                    
                    if id != self.user.id {
                        
                        print("***** \(String(describing: UsersDict[id])) ****")

                        let UserDict = UsersDict[id] as! NSDictionary
                        let name = UserDict["username"] as! String
                        let imageName = UserDict["imageName"] as! String
                        
                        
                        // We need to get the friendStatus
                        
                        
                        
                        
                        var friendStatus = "Request"
                        
                        if !self.checkDictForKey(dict: UserDict, key: "Friends", contains: self.user.id) {
                            // The two are not friends... Check the invites
                            print("THE TWO ARE NOT FRIENDS -> CHECK INVITES")
                            
                            
                            
                            if let userInvitesDict = UserDict["Invites"] as? NSDictionary {
                                if self.checkDictForKey(dict: userInvitesDict, key: "Received", contains: self.user.id) {
                                    // to search has received an invite from this user, status is pending
                                    print("SEARCHEE received invite -> PENDING")
                                    friendStatus = "Pending"
                                } else {
                                    print("SEARCHEE NOT received invite -> REQUEST")
                                }
                                
                                if friendStatus == "Pending" {
                                    print("IS PENDING -> CHECK IF THEIR SENT CONTAINS MY UID")
                                    if self.checkDictForKey(dict: userInvitesDict, key: "Sent", contains: self.user.id) {
                                        print("FRIENDS WE ARE")
                                        friendStatus = "Friends"
                                        print("THIS SHOULD TECHNICALLY NEVER PRINT")
                                    } else {
                                        print("NO SENT REQUESTS TO ME")
                                    }
                                } else {
                                    if self.checkDictForKey(dict: userInvitesDict, key: "Sent", contains: self.user.id) {
                                        print("THEY SENT US A REQUEST")
                                        friendStatus = "Accept"
                                    }
                                }
                            } else {
                                print("USERINVITEDICT ERROR")
                            }
                        } else {
                            friendStatus = "Friends"
                        }
                        
                       
                        
                        
                        print("---------------------------------------------------------\n")
                        
                        print("searching:\(username)")
                        print("comparing:\(name)")
                        print("with friendStatus: \(friendStatus)")
                        
                        print("username == name -> \(username.lowercased() == name.lowercased())")
                        print("name.contains(username) -> \(name.lowercased().contains(username.lowercased()))")
                        
                        print("\n---------------------------------------------------------")
                        
                        
                        
                        if username.lowercased() == name.lowercased() || name.lowercased().contains(username.lowercased()) {
                            // Found a user
                            /*
                             
                             we need name to display, image to display, and id
                             
                             */
                            
                            let result = searchResult(id: id, name: name, imageName: imageName, friendStatus: friendStatus)
                            results.append(result)
                            
                        }
                    }
                    
                    
                    
                }
                
                
                completion(true, results)
                
            } else {
                completion(false, nil)
            }
        }
    }
    
    func checkDictForKey(dict: NSDictionary, key: String, contains: String) -> Bool {
        if let searchDict = dict[key] as? NSDictionary {
            let allKeys = searchDict.allKeys as! [String]
            if allKeys.contains(contains) {
                // The ttwo are friends
                return true
            }
        }
        
        return false
    }
    
    
    func createNewSquad(squadName: String, squadImageName: String, squadPlayers: [Player]) {//, completion: (Bool) -> Void) {
        ref = Database.database().reference()
        print("CREATING NEW SQUAD FOR USER-ID: \(self.user.id)")
        let newSquadRef = ref.child("Users/\(self.user.id)/Favorites").childByAutoId()

        newSquadRef.child("name").setValue(squadName)
        newSquadRef.child("imageName").setValue(squadImageName)
        
        for squadPlayer in squadPlayers {
            newSquadRef.child("players").child(squadPlayer.id!).setValue(0)
        }
    }
    
    
    
    
    func addNewUser(id: String, username: String, email: String) {
        ref = Database.database().reference()
        let idRef = ref.child("Users").child(id)
        idRef.child("email").setValue(email)
        idRef.child("username").setValue(username)
        idRef.child("Favorites").setValue(0)
        idRef.child("Regiments").setValue(0)
        idRef.child("Friends").setValue(0)
        idRef.child("isOnline").setValue(true)
        idRef.child("ImageName").setValue("person")
        
    }
    
    
    func loadPlayerRegiments(CDM: CoreDataManager, completion: @escaping (Bool, [Regiment]) -> Void) {
        
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)/Regiments").observeSingleEvent(of: .value) { (regimentsSnapshot) in
            if let regimentDict = regimentsSnapshot.value as? NSDictionary {
                let allRegimentIds = regimentDict.allKeys as! [String]
                var regiments: [Regiment] = []
                for regimentId in allRegimentIds {
                    // Create a Gamer for each friend
                    let regimentDict = regimentDict[regimentId] as! NSDictionary
                    print(regimentDict)
                    let name = regimentDict["name"] as! String
                    let imageName = regimentDict["imageName"] as! String
//                    let isOnline = regimentDict["isOnline"] as? Bool ?? false
                    let players = regimentDict["players"] as! NSDictionary
                    
                    
                    var regimentPlayers: [Player] = []
                    let allPlayerIds = players.allKeys as! [String]
                    for playerId in allPlayerIds {
                        print("************** GET GAMER FROM ID: \(playerId)")
                        if let gamer = CDM.getPlayer(with: playerId) {
                            regimentPlayers.append(gamer)
                        }
                        
                        
                    }
                    
                    if !CDM.checkIfExists(id: regimentId, entityName: "Regiment") {
                        self.saveRegimentObject(for: CDM.context, id: regimentId, img: (UIImage(systemName: imageName)?.pngData())!, name: name, players: regimentPlayers) { (successful, regiment, err) in
                            if successful {
                                regiments.append(regiment!)
                            }
                        }
                        
                    }
                }
                completion(true, regiments)
            } else {
                completion(false, [])
            }
        }
    }
    
    func loadPlayerSquads(CDM: CoreDataManager, completion: @escaping (Bool, [Squad]) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)/Favorites").observeSingleEvent(of: .value) { (squadsSnapshot) in
            if let squadsDict = squadsSnapshot.value as? NSDictionary {
                let allSquadIds = squadsDict.allKeys as! [String]
                var squads: [Squad] = []
                for squadId in allSquadIds {
                    // Create a Gamer for each friend
                    let squadDict = squadsDict[squadId] as! NSDictionary
                    print(squadDict)
                    let name = squadDict["name"] as! String
                    let imageName = squadDict["imageName"] as! String
//                    let isOnline = squadDict["isOnline"] as? Bool ?? false
                    
                    
                    var squadPlayers: [Player] = []
                    if let gamers = squadDict["gamers"] as? NSDictionary {
                        let allGamerIds = gamers.allKeys as! [String]
                        for gamerId in allGamerIds {
                            print("************** GET GAMER FROM ID: \(gamerId)")
                            if let gamer = CDM.getPlayer(with: gamerId) {
                                squadPlayers.append(gamer)
                            }
                        }
                    }
                    
                    if !CDM.checkIfExists(id: squadId, entityName: "Squad") {
                        self.saveSquadObject(for: CDM.context, id: squadId, img: (UIImage(systemName: imageName)?.pngData())!, name: name, players: squadPlayers) { (successful, squad, err) in
                            if successful {
                                squads.append(squad!)
                            }
                        }
                        
                    }
                }
                completion(true, squads)
            } else {
                completion(false, [])
            }
        }
    }
    
    // load player Friends for user from Firebase
    func loadPlayerFriendIds(CDM: CoreDataManager, completion: @escaping (Bool, [Player]) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)/Friends").observeSingleEvent(of: .value) { (friendsSnapshot) in
            if let friendsDict = friendsSnapshot.value as? NSDictionary {
                
                print("Loading Player Friends")
                print(friendsDict)
                
                let allFriendIds = friendsDict.allKeys as! [String]
                
                
                
                var friends: [Player] = []
                for friendId in allFriendIds {
                    print("CREATING \(friendId)")
                    // Create a Gamer for each friend

                    // Get player object for friendId
                    if let friendDict = friendsDict[friendId] as? NSDictionary {
                        print(friendDict)
                        let name = friendDict["name"] as! String
                        let imageName = friendDict["imageName"] as! String
                        let isOnline = friendDict["isOnline"] as? Bool ?? false
                        let isReady = friendDict["isReady"] as? Bool ?? false

                        print("\(name) is online: \(isOnline)")


                        if !CDM.checkIfExists(id: friendId, entityName: "Player") {

                            print("Player \(friendId) doesnt exist - create player Object")

                            self.savePlayerObject(for: CDM.context, id: friendId, img: (UIImage(systemName: imageName)?.pngData())!, name: name, isOnline: isOnline, isReady: isReady) { (successful, player, err) in
                                if successful {
                                    friends.append(player!)
                                }
                            }
                        }
                    }
                }
                completion(true, friends)
            } else {
                completion(false, [])
            }
        }
    }
    
    func savePlayerObject(for context: NSManagedObjectContext, id: String, img: Data, name: String, isOnline: Bool, isReady: Bool, completion: (Bool, Player?, Error?) -> Void) {
        let player = Player(context: context)
        player.id = id
        player.img = img
        player.isOnline = isOnline
        player.isReady = isReady
        player.name = name
        
        do {
            try context.save()
            completion(true, player, nil)
        } catch let err {
            print("ERROR in createPlayerObject: \(err)")
            completion(false, nil, err)
            
        }
    }
    
    func saveSquadObject(for context: NSManagedObjectContext, id: String, img: Data, name: String, players: [Player], completion: (Bool, Squad?, Error?) -> Void) {
        let squad = Squad(context: context)
        squad.id = id
        squad.img = img
        squad.name = name
        
//        squad.addToPlayers(NSSet(array: players))
        
        squad.players = NSSet(array: players)
        
        do {
            try context.save()
            completion(true, squad, nil)
        } catch let err {
            print("ERROR in createPlayerObject: \(err)")
            completion(false, nil, err)
            
        }
        
        
    }
    
    
    func saveRegimentObject(for context: NSManagedObjectContext, id: String, img: Data, name: String, players: [Player], completion: (Bool, Regiment?, Error?) -> Void) {
        let regiment = Regiment(context: context)
        regiment.id = id
        regiment.img = img
        regiment.name = name
        regiment.players = NSSet(array: players)
        
        do {
            try context.save()
            completion(true, regiment, nil)
        } catch let err {
            print("ERROR in createPlayerObject: \(err)")
            completion(false, nil, err)
            
        }
        
        
    }
    
    
    func createNewPlayerFriend(uid: String, player: Player) {
        ref = Database.database().reference()
        ref.child("Users\(uid)/Friends").child(player.id!).setValuesForKeys(["imageName": "person", "isOnlien": player.isOnline])
    }
    
    
    func savePlayerFriendFromFirebase(uid: String, context: NSManagedObjectContext, completion: @escaping (Bool, Player?) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(uid)").observeSingleEvent(of: .value) { (PlayerSnapshot) in
            if let PlayerDict = PlayerSnapshot.value as? NSDictionary {
                
                let img = PlayerDict["imageName"] as! String
                let isOnline = PlayerDict["isOnline"] as? Bool ?? false
                
                let player = Player(context: context)
                player.id = uid
                player.img = UIImage(systemName: img)?.pngData()
                player.isOnline = isOnline
                player.isReady = false
                
                do {
                    try context.save()
                    completion(true, player)
                } catch let err {
                    print("Error saving new player in coreData: \(err)")
                    completion(false, nil)
                }
                
            } else {
                completion(false, nil)
            }
        }
    }
    
    
    func observeForInvites(completion: (Bool) -> Void) {
        ref = Database.database().reference()
        ref.child("Users/\(self.user.id)/Invites").observe(.childAdded) { (InviteSnapshot) in
            if let InviteDict = InviteSnapshot.value as? NSDictionary {
                print(InviteDict)
            }
        }
    }
    
    
    
    func removeObservers(location: String) {
        ref = Database.database().reference()
        ref.child(location).removeAllObservers()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func checkOnlineStatus(id: String, completion: @escaping (Bool) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(id)/isOnline").observeSingleEvent(of: .value) { (OnlineStatusSnap) in
//            completion(OnlineStatusSnap.value as! Bool)
//        }
//    }
//
//    func setOnlineStatus(ofUserId: String, and friends: [Gamer], to: Bool) {
//        ref = Database.database().reference()
//        ref.child("Users/\(ofUserId)/isOnline").setValue(to)
//        for friend in friends {
//            ref.child("Users/\(friend.id)/Friends/\(ofUserId)/isOnline").setValue(to)
//        }
//    }
//
//    func getGamer(id: String, completion: @escaping (Bool, Gamer) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(id)").observeSingleEvent(of: .value) { (GamerSnap) in
//            if let GamerDict = GamerSnap.value as? NSDictionary {
//
//
//                let name = GamerDict["name"] as! String
//                let imageName = GamerDict["imageName"] as! String
//                let isOnline = GamerDict["isOnline"] as? Bool ?? false
//                let gamer = Gamer(id: id, name: name, imageName: imageName, isOnline: isOnline)
//                completion(true, gamer)
//            }
//        }
//    }
//
//    func loadFriends(completion: @escaping (Bool, [Gamer]) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)/Friends").observeSingleEvent(of: .value) { (friendsSnapshot) in
//            if let friendsDict = friendsSnapshot.value as? NSDictionary {
//                let allFriendIds = friendsDict.allKeys as! [String]
//                var friends: [Gamer] = []
//                for friendId in allFriendIds {
//                    // Create a Gamer for each friend
//                    let friendDict = friendsDict[friendId] as! NSDictionary
//                    print(friendDict)
//                    let name = friendDict["name"] as! String
//                    let imageName = friendDict["imageName"] as! String
//                    let isOnline = friendDict["isOnline"] as? Bool ?? false
//
//                    print("\(name) is online: \(isOnline)")
//                    let gamer = Gamer(id: friendId, name: name, imageName: imageName, isOnline: true)
//                    friends.append(gamer)
//                }
//                completion(true, friends)
//            } else {
//                completion(false, [])
//            }
//        }
//    }
//
//    func loadFavorites(completion: @escaping (Bool, [Squad]) -> Void) {
//        ref = Database.database().reference()
//
//        ref.child("Users/\(userId)/Favorites").observeSingleEvent(of: .value) { (favoritesSnap) in
//            if let favoritesDict = favoritesSnap.value as? NSDictionary {
//                let allFavoriteIds = favoritesDict.allKeys as! [String]
//                var favorites: [Squad] = []
//                for favoriteId in allFavoriteIds {
//                    // Create a Squad class for each favorite
//                    let favoriteDict = favoritesDict[favoriteId] as! NSDictionary
//                    let name = favoriteDict["name"] as! String
//                    let imageName = favoriteDict["imageName"] as! String
//                    let gamersDict = favoriteDict["gamers"] as! NSDictionary
//
//                    let gamerIds = gamersDict.allKeys as! [String]
////                    let squad = Squad(id: favoriteId, gamerIds: gamerIds, imageName: imageName, name: name)
////                    favorites.append(squad)
//
//                }
//
//                completion(true, favorites)
//
//            } else {
//                completion(false, [])
//            }
//        }
//
//
//    }
    
    
    
    
    
    
    
    
    
    
//    
//    func createRegimentObject(from id: String, with memberIds: [String], completion: @escaping (Bool, Regiment?) -> Void) {
//        ref = Database.database().reference()
//        self.createMemberObject(from: memberIds) { (membersCreated, Members) in
//            if membersCreated {
//                guard let members = Members else { return }
//                self.ref.child("Regiments/\(id)").observeSingleEvent(of: .value) { (RegimentSnapshot) in
//                    if let RegimentDict = RegimentSnapshot.value as? NSDictionary {
//                        let imageName = RegimentDict["imageName"] as! String
//                        let name = RegimentDict["name"] as! String
////                        let regiment = Regiment(name: name, members: members, imageName: imageName, id: id)
//                        completion(true, nil)
//                    } else {
//                        completion(false, nil)
//                    }
//                }
//            }
//        }
//    }
//    
//    
//    func createRecentGameObject(from id: String, with playerIds: [String],  completion: @escaping (Bool, RecentGame?) -> Void) {
//        ref = Database.database().reference()
//        self.createMemberObject(from: playerIds) { (membersCreated, Members) in
//            if membersCreated {
//                guard let members = Members else { return }
//                self.ref.child("RecentGames/\(id)").observeSingleEvent(of: .value) { (RegimentSnapshot) in
//                    if let RegimentDict = RegimentSnapshot.value as? NSDictionary {
//                        let imageName = RegimentDict["imageName"] as! String
//                        let gamemode = RegimentDict["gamemode"] as! String
//                        
//                        let recentGame = RecentGame(id: id, members: members, gamemode: gamemode, imageName: imageName)
//                        
//                        completion(true, recentGame)
//                    } else {
//                        completion(false, nil)
//                    }
//                }
//            }
//        }
//    }
//    
//    
//    func createMemberObject(from ids: [String], completion: @escaping (Bool, [Friend]?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users").observeSingleEvent(of: .value) { (Snapshot) in
//            if let UsersDict = Snapshot.value as? NSDictionary {
//                var members: [Friend] = []
//                for id in ids {
//                    guard let UserDict = UsersDict[id] as? NSDictionary else { break }
//                    let name = UserDict["name"] as! String
//                    let desc = "TBD"
//                    let imageName = UserDict["imageName"] as! String
//                    let newFriend = Friend(name: name, desc: desc, imageName: imageName, id: id)
//                    members.append(newFriend)
//                }
//                completion(true, members)
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
//    
//    // LOAD FUNCTIONS
//    func loadRecentGameIds(completion: @escaping (Bool, [String: [String]]?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)/recentGameId").observeSingleEvent(of: .value) { (Snapshot) in
//            if let UserRecentGameDict = Snapshot.value as? NSDictionary {
//                let recentGameId = UserRecentGameDict.allKeys[0] as! String
//                let players = UserRecentGameDict[recentGameId] as! String
//                var playerIdsArray: [String] = []
//                let memberIdsArray = players.split(separator: ",")
//                for memberId in memberIdsArray {
//                    playerIdsArray.append(String(memberId))
//                }
//                completion(true, [recentGameId: playerIdsArray])
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
//    
//    func loadRegimentIds(completion: @escaping (Bool, [String: [String]]?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)/Regiments").observeSingleEvent(of: .value) { (Snapshot) in
//            if let UserRegimentDict = Snapshot.value as? NSDictionary {
//                var regimentIdsWithMembers: [String: [String]] = [:]
//                let allRegimentIds = UserRegimentDict.allKeys as! [String]
//                
//                for regimentId in allRegimentIds {
//                    let memberIds = UserRegimentDict[regimentId] as! String
//                    var RegimentMemberIds: [String] = []
//                    let memberIdsArray = memberIds.split(separator: ",")
//                    for memberId in memberIdsArray {
//                        RegimentMemberIds.append(String(memberId))
//                    }
//                    regimentIdsWithMembers[regimentId] = RegimentMemberIds
//                }
//                completion(true, regimentIdsWithMembers)
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
//    
//    func setOnlineStatusForRecentGame(status: String, for recentGame: RecentGame) {
//        ref = Database.database().reference()
//        ref.child("RecentGames/\(recentGame.Id)/memberIds/\(userId)").setValue(status)
//    }
//    
//    func listenForOnlineStatusChangeRecentGame(for recentGame: RecentGame) {
//        ref = Database.database().reference()
//        ref.child("RecentGames/\(recentGame.Id)/memberIds").observe(.childChanged) { (Snapshot) in
//            print("CHANGE DETECTED!!!")
//            print(Snapshot)
//        }
//    }
//    
    
    //--------------------------------------------------------------------------------
    
    
    
    
//    func createFriendObject(from id: String) -> Friend? {
//        ref = Database.database().reference()
//        var friend: Friend?
//
//        ref.child("Users\(id)").observeSingleEvent(of: .value) { (FriendSnapshot) in
//            if let friendsDict = FriendSnapshot.value as? NSDictionary {
//
//                let name = friendsDict["name"] as! String
//                let desc = "TBD"
//                let imageName = friendsDict["imageName"] as! String
//
//
//                friend = Friend(name: name, desc: desc, imageName: imageName)
//
//            }
//        }
//
//        if let newFriend = friend {
//            return newFriend
//        } else {
//            return nil
//        }
//    }
//
//
//
//    public func getRecentGameId(completion: @escaping (Bool, String?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)").child("recentGameId").observeSingleEvent(of: .value) { (Snapshot) in
//            if let recentGameId = Snapshot.value as? String {
//                //
//                print("Recent GameId: \(recentGameId)")
//                completion(true, recentGameId)
//            } else {
//                // No recent gameId
//                print("NO RECENT GAME ID")
//                completion(false, nil)
//            }
//        }
//    }
//
//
//
//
//
//    func loadRecentGame(completion: @escaping (Bool, RecentGame?) -> Void) {
//            ref = Database.database().reference()
//
//            self.getRecentGameId { (recentGameIdExists, recentGameId) in
//                if recentGameIdExists {
//                    print("WE HAVE RECENT GAME ID")
//                    self.ref.child("RecentGames/\(recentGameId!)").observeSingleEvent(of: .value) { (RecentGameSnapshot) in
//                        let recentGameDict = RecentGameSnapshot.value as! NSDictionary
//                        print("RecentGameDict:")
//                        print(recentGameDict)
//                        let membersDict = recentGameDict["memberIds"] as! NSDictionary
//
//                        var recentGameMembers: [Friend] = []
//                        let memberIds = membersDict.allKeys as! [String]
//                        for memberId in memberIds {
//                            // Create a friend object per Id
//                            if let friend = self.createFriendObject(from: memberId) {
//                                recentGameMembers.append(friend)
//                            }
//
//                        }
//    //                    let created = recentGameDict["created"] as! String
//                        let gamemode = recentGameDict["gamemode"] as! String
//                        let imageName = recentGameDict["created"] as! String
//
//                        let recentGame = RecentGame(members: recentGameMembers, gamemode: gamemode, imageName: imageName)
//
//                        print("Created Recent Game:")
//                        print(recentGame)
//                        completion(true, recentGame)
//
//                    }
//                } else {
//                    completion(false, nil)
//                }
//            }
//        }
//
//    func loadFriends(completion: @escaping (Bool, [Friend]?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)").child("Friends").observeSingleEvent(of: .value) { (FriendsSnapshot) in
//            if let friendsDict = FriendsSnapshot.value as? NSDictionary {
//                let allFriendIds = friendsDict.allKeys as! [String]
//                var Friends: [Friend] = []
//                for friendId in allFriendIds {
//                    if let friend = self.createFriendObject(from: friendId) {
//                        Friends.append(friend)
//                    }
//                }
//
//                completion(true, Friends)
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
    
    
//    func loadRegiments(completion: @escaping (Bool, [Regiment]?) -> Void) {
//        ref = Database.database().reference()
//        ref.child("Users/\(userId)/Regiments").observeSingleEvent(of: .value) { (RegimentSnapshot) in
//            if let regimentsDict = RegimentSnapshot.value as? NSDictionary {
//                let allRegimentIds = regimentsDict.allKeys as! [String]
//
//                var FIRRegiments: [Regiment] = []
//
//                for RegimentId in allRegimentIds {
//                    if let regiment = self.createRegimentObject(from: RegimentId) {
//                        FIRRegiments.append(regiment)
//                    }
//                }
//
//
//                completion(true, FIRRegiments)
//
//            } else {
//                completion(false, nil)
//            }
//        }
//    }
    
}

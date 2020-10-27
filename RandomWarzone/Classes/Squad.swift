//
//  Squad.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 22.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class Gamer: Equatable {
    
    let id: String
    let name: String
    let imageName: String
    var isOnline: Bool
    
    init(id: String, name: String, imageName: String, isOnline: Bool) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.isOnline = isOnline
    }
    
    static func == (lhs: Gamer, rhs: Gamer) -> Bool {
        return true
    }
    
}

//class Squad: Equatable {
//
//    let gamerIds: [String]
//    var gamers: [Gamer] = []
//    let id: String
//    let imageName: String
//    let name: String
//
//
//    init(id: String, gamerIds: [String], imageName: String, name: String) {
//        self.id = id
//        self.gamerIds = gamerIds
//        self.imageName = imageName
//        self.name = name
//    }
//
//    func setupGamers(from friends: [Gamer]) {
//        for friend in friends {
////            print("Does \(self.gamerIds) contain: \(friend.id) -> \(self.gamerIds.contains(friend.id))")
//            if self.gamerIds.contains(friend.id) && !self.gamers.contains(friend) {
//                self.gamers.append(friend)
//            }
//        }
//    }
//
//
//    static func == (lhs: Squad, rhs: Squad) -> Bool {
//        return true
//    }
//
//
//}

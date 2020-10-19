//
//  Perks.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 10.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

public struct Perk {
    let name: String
    let category: String
    let imageName: String
}

public class Perks {
    
    var perkOne: Perk
    var perkTwo: Perk
    var perkThree: Perk
    
    init(perk_One: Perk, perk_Two: Perk, perk_Three: Perk) {
        self.perkOne = perk_One
        self.perkTwo = perk_Two
        self.perkThree = perk_Three
    }
    
}

// Perk one
public let doubleTime = Perk(name: "Double Time", category: "1", imageName: "DoubleTime")
public let EOD = Perk(name: "E.O.D", category: "1", imageName: "EOD")
public let scavenger = Perk(name: "Scavenger", category: "1", imageName: "Scavenger")
public let coldBlooded = Perk(name: "Cold Blooded", category: "1", imageName: "ColdBlooded")
public let killChain = Perk(name: "Kill Chain", category: "1", imageName: "KillChain")
public let quickFix = Perk(name: "Quick Fix", category: "1", imageName: "QuickFix")

let perkOneList = [doubleTime, EOD, scavenger, coldBlooded, killChain, quickFix]

// Perk 2
public let restock = Perk(name: "Restock", category: "2", imageName: "Restock")
public let hardline = Perk(name: "Hardline", category: "2", imageName: "Hardline")
public let overkill = Perk(name: "Overkill", category: "2", imageName: "Overkill")
public let highAlert = Perk(name: "High Alert", category: "2", imageName: "HighAlert")
public let ghost = Perk(name: "Ghost", category: "2", imageName: "Ghost")
public let pointman = Perk(name: "Pointman", category: "2", imageName: "Pointman")

let perkTwoList = [restock, hardline, overkill, highAlert, ghost, pointman]

// Perk 3
public let tuneUp = Perk(name: "Tune Up", category: "3", imageName: "TuneUp")
public let amped = Perk(name: "Amped", category: "3", imageName: "Amped")
public let shrapnel = Perk(name: "Shrapnel", category: "3", imageName: "Shrapnel")
public let battleHardened = Perk(name: "Battle Hardened", category: "3", imageName: "BattleHardened")
public let spotter = Perk(name: "Spotter", category: "3", imageName: "Spotter")
public let tracker = Perk(name: "Tracker", category: "3", imageName: "Tracker")

let perkThreeList = [tuneUp, amped, shrapnel, battleHardened, spotter, tracker]

//import UIkit
//
//public struct Perk {
//    let name: String
//}
//
//public struct Perks {
//    let perk1: [Perk]
//    let perk2: [Perk]
//    let perk3: [Perk]
//}
//
//class RandomPerks {
//
//    var perks: Perks
//
//    init() {
//
//    }
//}

/*
voted for grüne for vienna
voted for spö for district
 actual district different name, wrote Michael ludwig, 2 different parties. Bürgermeister take care of district not all vienna
 
 Told Mimi about us
 just between them
 said it because convo was not flowing,
 hang out with someone and not really vibe (theresa)
 You can tell we're good together
 same time, she thought I was always the same haha

 
 
 
 
 */

//
//  TacticalAndLethal.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 12.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

public struct Tactical {
    let name: String
    let imageName: String
}

public struct Lethal {
    let name: String
    let imageName: String
}

public class Tacticals {
    var tactical: Tactical
    
    init(tactical: Tactical) {
        self.tactical = tactical
    }
    
}

public class Lethals {
    var lethal: Lethal
    
    init(lethal: Lethal) {
        self.lethal = lethal
    }
}


// Lethals
public let claymore = Lethal(name: "Claymore", imageName: "claymore")
public let fragGrenade = Lethal(name: "Frag Grenade", imageName: "fragGrenade")
public let molotovCocktail = Lethal(name: "Molotov Cocktail", imageName: "molotovCocktail")
public let C_four = Lethal(name: "C4", imageName: "C_four")
public let semtex = Lethal(name: "Semtex", imageName: "semtex")
public let throwingKnife = Lethal(name: "Throwing Knife", imageName: "throwingKnife")
public let proximityMine = Lethal(name: "Proximity Mine", imageName: "proximityMine")
public let thermite = Lethal(name: "Thermite", imageName: "thermite")

public let lethalsList = [claymore, fragGrenade, molotovCocktail, C_four, semtex, throwingKnife, proximityMine, thermite]

// Tacticals
public let flashGrenade = Tactical(name: "Flash Grenade", imageName: "flashGrenade")
public let stunGrenade = Tactical(name: "Stun Grenade", imageName: "stunGrenade")
public let smokeGrenade = Tactical(name: "Smoke Grenade", imageName: "smokeGrenade")
public let snapshotGrenade = Tactical(name: "Snapshot Grenade", imageName: "snapshotGrenade")
public let heartbeatSensor = Tactical(name: "Heartbeta Sensor", imageName: "heartbeatSensor")
public let gasGrenade = Tactical(name: "Gas Grenade", imageName: "gasGrenade")
public let stim = Tactical(name: "Stim", imageName: "stim")
public let decoyGrenade = Tactical(name: "Decoy Grenade", imageName: "decoyGrenade")

public let tacticalsList = [flashGrenade, stunGrenade, smokeGrenade, snapshotGrenade, heartbeatSensor, gasGrenade, stim, decoyGrenade]

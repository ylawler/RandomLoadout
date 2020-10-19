//
//  AssaultRifles.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 10.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
// ---------------------------------------------------------------------------------------------

public struct attachment: Equatable {
    let name: String
}



class Attachments {
    
    var muzzle: [attachment]
    var barrel: [attachment]
    var laser: [attachment]
    var optic: [attachment]
    var stock: [attachment]
    var triggerAction: [attachment]
    var underbarrel: [attachment]
    var ammunition: [attachment]
    var rearGrip: [attachment]
    var perk: [attachment]
    
    var allAttachments: [String: [attachment]]
    
    init(attachments: attachments) {
        self.muzzle = attachments.muzzle
        self.barrel = attachments.barrel
        self.laser = attachments.laser
        self.optic = attachments.optic
        self.stock = attachments.stock
        self.triggerAction = attachments.triggerAction
        self.underbarrel = attachments.underbarrel
        self.ammunition = attachments.ammunition
        self.rearGrip = attachments.rearGrip
        self.perk = attachments.perk
        
        self.allAttachments = ["Muzzle": self.muzzle,
                               "Barrel": self.barrel,
                               "Laser": self.laser,
                               "Optic": self.optic,
                               "Stock": self.stock,
                               "Trigger Action": self.triggerAction,
                               "Underbarrel": self.underbarrel,
                               "Ammunition": self.ammunition,
                               "Rear Grip": self.rearGrip,
                               "Perk": self.perk]
        
    }
    
    func getAttachmentKeys() -> [String] {
        var keys: [String] = []
        for attachment in self.allAttachments {
            keys.append(attachment.key)
        }
        return keys
    }
    
}

public struct attachments {
    
    let muzzle: [attachment]
    let barrel: [attachment]
    let laser: [attachment]
    let optic: [attachment]
    let stock: [attachment]
    let triggerAction: [attachment]
    let underbarrel: [attachment]
    let ammunition: [attachment]
    let rearGrip: [attachment]
    let perk: [attachment]
    
    
    
    
    
//    func getRandomAttachmentKey() -> String {
//        var attachmentKeyFound: Bool = false
//        var key: String = "ERROR"
//
//        var updatedAllAttachments = self.allAttachments
//
//        while attachmentKeyFound == false {
//            key = updatedAllAttachments[Int.random(in: 0..<updatedAllAttachments.count)]
//            print("checking key: \(key)")
//
//            if key == "Muzzle" {
//                // check if Muzzle is empty
//                if self.muzzle != [] {
//                    attachmentKeyFound = true
//                } else {
//                    updatedAllAttachments = self.remove(key: key, from: updatedAllAttachments)
//                }
//            } else if key == "Barrel" {
//               // check if Barrel is empty
//                if self.barrel != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Laser" {
//                // check if Laser is empty
//                if self.laser != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Optic" {
//                // check if Optic is empty
//                if self.optic != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Stock" {
//                // check if Stock is empty
//                if self.stock != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Trigger Action" {
//                // check if Trigger Action is empty
//                if self.triggerAction != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Underbarrel" {
//                // check if Underbarrel is empty
//                if self.underbarrel != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Ammunition" {
//                // check if Ammunition is empty
//                if self.ammunition != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Rear Grip" {
//                // check if Rear Grip is empty
//                if self.rearGrip != [] {
//                    attachmentKeyFound = true
//                }
//            } else if key == "Perk" {
//               // check if Perk is empty
//                if self.perk != [] {
//                    attachmentKeyFound = true
//                }
//            }
//        }
//
//        return key
//
//    }
    
//    func remove(key: String, from: [String]) -> [String] {
//        var fromArray = from
//        let idx = fromArray.firstIndex(of: key)!
//        fromArray.remove(at: idx)
//        return fromArray
//    }
    
    
}



// ------------------------------------------- MUZZLES ---------------------------------------
/// Assault Rifle --> M13, Kilo, M4A1
public let tacticalSuppressor = attachment(name: "Tactical Suppressor")
public let flashGuard = attachment(name: "Flash Guard")
public let muzzleBrake = attachment(name: "Muzzle Brake")
public let breacherDevice = attachment(name: "Breacher Device")
public let lightweightSuppressor = attachment(name: "Lightweight Suppressor")
public let compensator = attachment(name: "Compensator")
public let monolithicSuppressor = attachment(name: "Monolithic Suppressor")


// ------------------------------------------- BARRELS -----------------------------------------
/// Assault Rifle --> M13
public let tempusMini = attachment(name: "Tempus Mini")
public let tempusCyclone = attachment(name: "Tempus Cyclone")
public let tempusMarksman = attachment(name: "Tempus Marksman")

/// Assault Rifle --> Kilo
public let singuardArmsSOCOM = attachment(name: "Singuard Arms 16.6\" SOCOM")
public let singuardArmsProwler = attachment(name: "Singuard Arms 19.8\" Prowler")
public let singuardArmsWhisper = attachment(name: "Singuard Arms Whisper")

/// Assault Rifle --> FAL
public let ultralight_eightteen = attachment(name: "18.0\" Ultralight")
public let XRKMarksman = attachment(name: "XRK Marksman")
public let OSWPara = attachment(name: "13.0\" OSW Para")

/// Assault Rifle --> M4A1
public let FSSCommando = attachment(name: "FSS 11.5\" Commando")
public let stockGrenadier = attachment(name: "Stock M16 Grenadier")
public let FSSTacLite = attachment(name: "FSS 14.5\" Tac Lite")
public let corvusCustomMarksman = attachment(name: "Corvus Custom Marksman")
public let FSSPredator = attachment(name: "FSS 12.4\" Predator")

/// Assault Rifle --> FR 5.56
public let FRCommando = attachment(name: "FR 15.9\" Commando")
public let FRSniper = attachment(name: "FR 24.4\" Sniper")



// ------------------------------------------- LASERS ------------------------------------------

/// Assault Rifle --> M13, Kilo
public let mWLaser_one = attachment(name: "1mW Laser")
public let tacLaser = attachment(name: "Tac Laser")
public let mWLaser_five = attachment(name: "5mW Laser")


// ------------------------------------------- OPTICS ------------------------------------------
/// Assault Rifle --> M13, Kilo, FAL
public let solozeroMiniReflex = attachment(name: "Solozero Optics Mini Reflex")
public let aimOpReflex = attachment(name: "Aim-Op Reflex Sight")
public let corpCombatHolo = attachment(name: "Corp Combat Holo Sight")
public let scoutCombat = attachment(name: "Scout Combat Optic")
public let operatorReflex = attachment(name: "Operator Reflex Sight")
public let flipHybrid = attachment(name: "4.0x Flip Hybrid")
public let APXHolographic = attachment(name: "APX5 Holographic Sight")
public let GIMiniReflex = attachment(name: "G.I. Mini Reflex")
public let VLK = attachment(name: "VLK 3.0x Optic")
public let cronenMiniReflex = attachment(name: "Cronen LP945 Mini Reflex")
public let ViperReflex = attachment(name: "Viper Reflex Sight")
public let sniperScope = attachment(name: "Sniper Scope")
public let solozeroNVGEnhanced = attachment(name: "Solozero NVG Enhanced")
public let monocleReflex = attachment(name: "Monocle Reflex Sight")
public let cronenPro = attachment(name: "Cronen C480 Pro Optic")
public let mercThermal = attachment(name: "Merc Thermal")
public let cantedHybrid = attachment(name: "Canted Hybrid")
public let PBXHolo = attachment(name: "PBX Holo 7 Sight")
public let thermalHybrid = attachment(name: "Thermal Hybrid")
public let integralHybrid = attachment(name: "Integral Hybrid")
public let variableZoom = attachment(name: "Variable Zoom Scope")




// ------------------------------------------- STOCKS ------------------------------------------
/// Assault Rifle --> M13
public let FORGETacStalker = attachment(name: "FORGE TAC Stalker")
public let noStock = attachment(name: "No Stock")
public let FSSCloseQuarters = attachment(name: "FSS Close Quarters Stock")
public let M_one_three_Skeleton = attachment(name: "M13 Skeleton Stock")


/// Assault Rifle --> Kilo
public let FORGETacUltralight = attachment(name: "FORGE TAC Stalker")
//public let noStock = Stock(name: "No Stock")
//public let FSSCloseQuarters = Stock(name: "FSS Close Quarters Stock")
public let singuardArmsSniperPro = attachment(name: "Singuard Arms Sniper Pro")

/// Assault Rifle --> FAL
//public let FORGETacStalker = Stock(name: "FORGE TAC Stalker")
//public let noStock = Stock(name: "No Stock")
//public let FSSCloseQuarters = Stock(name: "FSS Close Quarters Stock")
public let factoryAluminium = attachment(name: "Factory 18 Aluminium Stock")

/// Assault Rifle --> M4
public let FORGETacCQS = attachment(name: "FORGE TAC CQS")
//public let noStock = Stock(name: "No Stock")
public let singuardArmsInvader = attachment(name: "Singuard Arms Invader")
public let m_sixteenStock = attachment(name: "M-16 Stock")

/// Assault Rifle --> FR 5.56
public let FORGETacBallastPack = attachment(name: "FORGE TAC Ballast Pack")
public let FRUltralightHollow = attachment(name: "FR Ultralight Hollow")
public let FSSTacWrap = attachment(name: "FSS Tac-Wrap")



// ----------------------------------------- UNDERBARRELS --------------------------------------
/// Assault Rifle --> M13, Kilo
public let mercForegrip = attachment(name: "Merc Foregrip")
public let MSmokescreen = attachment(name: "M203 40mm Smokescreen")
public let commandoForegrip = attachment(name: "Commando Foregrip")
public let MIncendiary = attachment(name: "M203 40mm Incendiary")
public let MFlash = attachment(name: "M203 40mm Flash")
public let bipod = attachment(name: "Bipod")
public let MHighExplosive = attachment(name: "M203 40mm High-explosive")
public let tacticalForegrip = attachment(name: "Tactical Foregrip")
public let MConcussive = attachment(name: "M203 40mm Concussive")
public let rangerForegrip = attachment(name: "Ranger Foregrip")
public let MRecon = attachment(name: "M203 40mm Recon")
public let operatorForegrip = attachment(name: "Operator Foregrip")
public let gaugeDeputy = attachment(name: "12 Gauge Deputy")





// ----------------------------------------- AMMUNITION ----------------------------------------
/// Assault Rifle --> M13
public let fiftyMags = attachment(name: "50 Round Mags")
public let blackoutThirty = attachment(name: ".300 Blackout 30-Round Mags")
public let sixtyMags = attachment(name: "60 Round Mags")

/// Assault Rifle --> Kilo
//public let fiftyMags = attachment(name: "50 Round Mags")
//public let sixtyMags = attachment(name: "60 Round Mags")
public let hundredDrums = attachment(name: "100 Round Drums")

/// Assault Rifle --> FAL
public let twentyFourMags = attachment(name: "24 Round Mags")
public let thirtyMags = attachment(name: "30 Round Mags")

/// Assault Rifle --> M4A1
//public let fiftyMags = attachment(name: "50 Round Mags")
//public let sixtyMags = attachment(name: "60 Round Mags")
public let para_thirtyTwo = attachment(name: "9mm Para 32-Round Mags")
public let SOCOM_ten = attachment(name: ".458 SOCOM 10-Round Mags")




// ----------------------------------------- REAR GRIP -----------------------------------------
/// Assault Rifle --> M13, Kilo
public let granulated = attachment(name: "Granulated Grip Tape")
public let stippled = attachment(name: "Stippled Grip Tape")
public let rubberized = attachment(name: "Rubberized Grip Tape")




// ------------------------------------------- PERK --------------------------------------------

/// Assault Rifle --> M13, Kilo
public let heavyHitter = attachment(name: "Heavy Hitter")
public let frangibleWounding = attachment(name: "Frangible - Wounding")
public let fullyLoaded = attachment(name: "Fully Loaded")
public let sleightOfHand = attachment(name: "Sleight of Hand")
public let burst = attachment(name: "Burst")
public let moMoney = attachment(name: "Mo'Money")
public let fastMelee = attachment(name: "Fast Melee")
public let frangibleDisabling = attachment(name: "Frangible - Disabling")
public let recon = attachment(name: "Recon")
public let FMJ = attachment(name: "FMJ")
public let presenceOfMind = attachment(name: "Presence of Mind")



public let m_thirteen_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                         muzzleBrake, breacherDevice, lightweightSuppressor, compensator, monolithicSuppressor],
                                                barrel: [tempusMini, tempusCyclone, tempusMarksman],
                                                laser: [mWLaser_one, tacLaser, mWLaser_five],
                                                optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                                stock: [FORGETacStalker, noStock, FSSCloseQuarters, M_one_three_Skeleton],
                                                triggerAction: [],
                                                underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                                ammunition: [fiftyMags, blackoutThirty, sixtyMags],
                                                rearGrip: [granulated, stippled, rubberized],
                                                perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])

public let kilo_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                   muzzleBrake, breacherDevice, lightweightSuppressor, compensator, monolithicSuppressor],
                                          barrel: [singuardArmsSOCOM, singuardArmsProwler, singuardArmsWhisper],
                                          laser: [mWLaser_one, tacLaser, mWLaser_five],
                                          optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                          stock: [FORGETacUltralight, noStock, FSSCloseQuarters, singuardArmsSniperPro],
                                          triggerAction: [],
                                          underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                          ammunition: [fiftyMags, sixtyMags, hundredDrums],
                                          rearGrip: [granulated, stippled, rubberized],
                                          perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])

public let FAL_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                   muzzleBrake, lightweightSuppressor, compensator, monolithicSuppressor],
                                          barrel: [ultralight_eightteen, XRKMarksman, OSWPara],
                                          laser: [mWLaser_one, tacLaser, mWLaser_five],
                                          optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                          stock: [FORGETacStalker, noStock, FSSCloseQuarters, factoryAluminium],
                                          triggerAction: [],
                                          underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                          ammunition: [twentyFourMags, thirtyMags],
                                          rearGrip: [granulated, stippled, rubberized],
                                          perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])

public let m_four_A_one_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                  muzzleBrake, lightweightSuppressor, compensator, monolithicSuppressor],
                                         barrel: [FSSCommando, stockGrenadier, FSSTacLite, corvusCustomMarksman, FSSPredator],
                                         laser: [mWLaser_one, tacLaser, mWLaser_five],
                                         optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                         stock: [m_sixteenStock, singuardArmsInvader, noStock, FORGETacCQS],
                                         triggerAction: [],
                                         underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                         ammunition: [fiftyMags, sixtyMags, para_thirtyTwo, SOCOM_ten],
                                         rearGrip: [granulated, stippled, rubberized],
                                         perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])


public let FR_five_five_six_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                               muzzleBrake, lightweightSuppressor, compensator, monolithicSuppressor],
                                                      barrel: [FORGETacUltralight, FRCommando, FRSniper],
                                                      laser: [mWLaser_one, tacLaser, mWLaser_five],
                                                      optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                                      stock: [FRUltralightHollow, FORGETacBallastPack, FSSTacWrap],
                                                      triggerAction: [],
                                                      underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                                      ammunition: [fiftyMags, sixtyMags],
                                                      rearGrip: [granulated, stippled, rubberized],
                                                      perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])


public let Kilo = weapon(name: "Kilo 141", attachments: kilo_attachments, imageName: "Kilo 141", category: assaultRifleCategory)
public let FAL = weapon(name: "FAL", attachments: FAL_attachments, imageName: "FAL", category: assaultRifleCategory)
public let M4A1 = weapon(name: "M4A1", attachments: m_four_A_one_attachments, imageName: "M4A1", category: assaultRifleCategory)
public let FR_556 = weapon(name: "FR 5.56", attachments: FR_five_five_six_attachments, imageName: "FR 556", category: assaultRifleCategory)
public let Oden = weapon(name: "Oden", attachments: kilo_attachments, imageName: "Oden", category: assaultRifleCategory)
public let M13 = weapon(name: "M13", attachments: kilo_attachments, imageName: "M13", category: assaultRifleCategory)
public let FN_SCAR = weapon(name: "FN SCAR 17", attachments: kilo_attachments, imageName: "FN SCAR 17", category: assaultRifleCategory)
public let AK_47 = weapon(name: "AK-47", attachments: kilo_attachments, imageName: "AK-47", category: assaultRifleCategory)
public let RAM_7 = weapon(name: "RAM-7", attachments: kilo_attachments, imageName: "RAM-7", category: assaultRifleCategory)
public let Grau_556 = weapon(name: "Grau 5.56", attachments: kilo_attachments, imageName: "Grau 556", category: assaultRifleCategory)
public let CR_AMAX = weapon(name: "CR-56 AMAX", attachments: kilo_attachments, imageName: "CR-56 AMAX", category: assaultRifleCategory)
public let AN_94 = weapon(name: "AN-94", attachments: kilo_attachments, imageName: "AN-94", category: assaultRifleCategory)
public let AS_VAL = weapon(name: "AS VAL", attachments: kilo_attachments, imageName: "AS VAL", category: assaultRifleCategory)

public let ARs = [Kilo, FAL, M4A1, Oden, M13, FN_SCAR, AK_47, RAM_7, Grau_556, CR_AMAX, AN_94, AS_VAL]



public let ARList = ["Kilo 141": kilo_attachments,
                     "FAL": FAL_attachments,
                     "M4A1": m_four_A_one_attachments,
                     "FR 5.56": FR_five_five_six_attachments,
                     "Oden": kilo_attachments,
                     "M13": kilo_attachments,
                     "FN SCAR 17": kilo_attachments,
                     "AK-47": kilo_attachments,
                     "RAM-7": kilo_attachments,
                     "Grau 5.56": kilo_attachments,
                     "CR-56 AMAX": kilo_attachments,
                     "AN-94": kilo_attachments,
                     "AS VAL": kilo_attachments]

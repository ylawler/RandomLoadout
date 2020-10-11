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
//    let image: String
}

public struct attachments {
    
    let muzzle: [attachment]
    let barrel: [attachment]
    let laser: [attachment]
    let optic: [attachment]
    let stock: [attachment]
    let underbarrel: [attachment]
    let ammunition: [attachment]
    let rearGrip: [attachment]
    let perk: [attachment]
    
    let allAttachments = ["Muzzle", "Barrel", "Laser", "Optic", "Stock", "Underbarrel", "Ammunition", "Rear Grip", "Perk"]
    
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






//------------------------------------------ CLASSES --------------------------------------------
class AssaultRifle {
    
    var Attachments: attachments
    var name: String
    
    var existingAttachments: [String: attachment] = [:]
    
    init(name: String, attachments: attachments) {
        self.Attachments = attachments
        self.name = name
        setupRandom()
    }
    
    private func setupRandom() {
        
        // Get a random number between 1 and 5 -> Determine how many attachments
        let numberOfRandomAttachments = Int.random(in: 0...5)
        
        
        // For the above number of times, choose a random attachment category
        print("-------------------------------------------------")
        print("number of random attachments: \(numberOfRandomAttachments)")
        if numberOfRandomAttachments == 0 {
            // No attachments...
        } else {
            
            
            for i in 1...numberOfRandomAttachments {
                print("attachment no. : \(i) / \(numberOfRandomAttachments)")
                if self.existingAttachments != [:] {
                    // We have an or more existing attachments
                    var newAttachmentFound = false
                    var randomAttachmentKey = ""
                    while newAttachmentFound == false {
                        randomAttachmentKey = self.Attachments.allAttachments[Int.random(in: 0..<9)]
                        
                        if self.existingAttachments.keys.contains(randomAttachmentKey) {
                            // keep searching
                        } else {
                            newAttachmentFound = true
                        }
                    }
                    self.setRandomAttachment(for: randomAttachmentKey)
                    
                    
                } else {
                    let randomAttachmentKey = self.Attachments.allAttachments[Int.random(in: 0..<9)]
                    self.setRandomAttachment(for: randomAttachmentKey)
                }
            }
        }
        
    }
    
    func setRandomAttachment(for key: String) {
        // For each random category, choose a random attachment
        var randomAttachment: attachment!
        
        if key == "Muzzle" {
            // get random Muzzle
            randomAttachment = self.Attachments.muzzle[Int.random(in: 0..<self.Attachments.muzzle.count)]
        } else if key == "Barrel" {
            // get random Barrel
            randomAttachment = self.Attachments.barrel[Int.random(in: 0..<self.Attachments.barrel.count)]
        } else if key == "Laser" {
            // get random Barrel
            randomAttachment = self.Attachments.laser[Int.random(in: 0..<self.Attachments.laser.count)]
        } else if key == "Optic" {
            // get random Barrel
            randomAttachment = self.Attachments.optic[Int.random(in: 0..<self.Attachments.optic.count)]
        } else if key == "Stock" {
            // get random Barrel
            randomAttachment = self.Attachments.stock[Int.random(in: 0..<self.Attachments.stock.count)]
        } else if key == "Underbarrel" {
            // get random Barrel
            randomAttachment = self.Attachments.underbarrel[Int.random(in: 0..<self.Attachments.underbarrel.count)]
        } else if key == "Ammunition" {
            // get random Barrel
            randomAttachment = self.Attachments.ammunition[Int.random(in: 0..<self.Attachments.ammunition.count)]
        } else if key == "Rear Grip" {
            // get random Barrel
            randomAttachment = self.Attachments.rearGrip[Int.random(in: 0..<self.Attachments.rearGrip.count)]
        } else if key == "Perk" {
            // get random Barrel
            randomAttachment = self.Attachments.perk[Int.random(in: 0..<self.Attachments.perk.count)]
        }
        print("Setting \(key) attachment to \(randomAttachment.name)\n")
        self.existingAttachments[key] = randomAttachment
    }

    
}

public let m_thirteen_attachments = attachments(muzzle: [tacticalSuppressor, flashGuard,
                                                         muzzleBrake, breacherDevice, lightweightSuppressor, compensator, monolithicSuppressor],
                                                barrel: [tempusMini, tempusCyclone, tempusMarksman],
                                                laser: [mWLaser_one, tacLaser, mWLaser_five],
                                                optic: [solozeroMiniReflex, aimOpReflex, corpCombatHolo, scoutCombat, operatorReflex, flipHybrid, APXHolographic, GIMiniReflex, VLK, cronenMiniReflex, ViperReflex, sniperScope, solozeroNVGEnhanced, monocleReflex, cronenPro, mercThermal, cantedHybrid, PBXHolo, thermalHybrid, integralHybrid, variableZoom],
                                                stock: [FORGETacStalker, noStock, FSSCloseQuarters, M_one_three_Skeleton],
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
                                                      underbarrel: [mercForegrip, MSmokescreen, commandoForegrip, MIncendiary, MFlash, bipod, MHighExplosive, tacticalForegrip, MConcussive, rangerForegrip, MRecon, operatorForegrip, gaugeDeputy],
                                                      ammunition: [fiftyMags, sixtyMags],
                                                      rearGrip: [granulated, stippled, rubberized],
                                                      perk: [heavyHitter, frangibleWounding, fullyLoaded, sleightOfHand, burst, moMoney, fastMelee, frangibleDisabling, recon, FMJ, presenceOfMind])




public let ARList = ["Kilo 141": kilo_attachments, "FAL": FAL_attachments, "M4A1": m_four_A_one_attachments, "FR 5.56": FR_five_five_six_attachments, "Oden": kilo_attachments, "M13": kilo_attachments, "FN SCAR 17": kilo_attachments, "AK-47": kilo_attachments, "RAM-7": kilo_attachments, "Grau 5.56": kilo_attachments, "CR-56 AMAX": kilo_attachments, "AN-94": kilo_attachments, "AS VAL": kilo_attachments]

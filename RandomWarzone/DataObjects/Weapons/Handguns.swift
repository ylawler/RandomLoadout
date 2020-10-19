//
//  Handguns.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 12.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit



// ------------------------------------------- MUZZLES ---------------------------------------
public let oilCanSuppressor = attachment(name: "Oil Can Suppressor")
public let desperadoProCompensator = attachment(name: "Desperado Pro Compensator")



// ------------------------------------------- BARRELS ---------------------------------------
public let snubNose = attachment(name: ".357 Snub Nose")
public let silverfieldOrdnance = attachment(name: "Silverfield Ordnance .357")
public let long = attachment(name: ".357 Long")

public let four_five_compact = attachment(name: ".45 Compact")
public let four_five_matchGrade = attachment(name: ".45 Match Grade")
public let nineteen_eleven_stalker = attachment(name: "1911 Stalker")

public let singuardArmsFeatherweight = attachment(name: "Singuard Arms Featherweight")
public let vanguardElite = attachment(name: "Vanguard Elite")
public let singuardArmsAdvantage = attachment(name: "Singuard Arms Advantage")

public let XRKLSuper = attachment(name: "XRK L Super")
public let XRKVExtended = attachment(name: "XRK V Extended")
public let A_lightweight = attachment(name: "A9-16 Lightweight")

public let FORGETacExtended = attachment(name: "FORGE Tac Extended")
public let FORGETacEnforcer = attachment(name: "FORGE Tac Enforcer")

public let mkCompetition = attachment(name: "Mk1 Competition")
public let mkExtended = attachment(name: "Mk1 Extended")
public let mkBurstMod = attachment(name: "Mk3 Burst Mod")

// ------------------------------------------- Optic ---------------------------------------
public let lockwoodPistolScope = attachment(name: "Lockwood Pistol Scope")
public let XRKPistolScope = attachment(name: "XRK 4.0x Pistol Scope")

// ------------------------------------------- STOCK ---------------------------------------
public let FTACSatusCS_three = attachment(name: "FTAC Satus CS-3")
public let FTACGX = attachment(name: "FTAC G-X")
public let FTACSatusCSX = attachment(name: "FTAC Satus CS-X")

// ------------------------------------------- Trigger Action ---------------------------------------
public let lightweightTrigger = attachment(name: "Lightweight Trigger")
public let heavyTrigger = attachment(name: "Heavy Trigger")
public let matchGradeTrigger = attachment(name: "Match Grade Trigger")


// ------------------------------------------- Ammunition ---------------------------------------
public let snakeShot = attachment(name: "Snake Shot")
public let tenRounds = attachment(name: "10 Round Mags")
public let fifteenRounds = attachment(name: "15 Round Mags")
public let seventeenRounds = attachment(name: "17 Round Mags")
public let twentySixRounds = attachment(name: "26 Round Mags")
public let thirtyTwoRounds = attachment(name: "32 Round Mags")
public let twentyOneRounds = attachment(name: "21 Round Mags")
public let twentySevenRounds = attachment(name: "27 Round Mags")

// ------------------------------------------- REAR GRIP ---------------------------------------
public let lockwoodCustom = attachment(name: "Lockwood .357 Custom Stock")
public let FSSRaider = attachment(name: "FSS Raider Stock")

public let x_sixteen_stock = attachment(name: "X16 Stock")

public let XRKProGrip = attachment(name: "XRK Pro Grip")
public let XRKSpeedGrip = attachment(name: "XRK Speed Grip")

// ------------------------------------------- PERK ---------------------------------------
public let akimbo = attachment(name: "Akimbo")


//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
// .357
public let three_five_seven_list = attachments(muzzle: [flashGuard, muzzleBrake, compensator],
                                                        barrel: [snubNose, silverfieldOrdnance, long],
                                                        laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                        optic: [operatorReflex, aimOpReflex, corpCombatHolo, GIMiniReflex, solozeroMiniReflex, scoutCombat, APXHolographic, ViperReflex, VLK, cronenMiniReflex, monocleReflex, cronenPro, lockwoodPistolScope],
                                                        stock: [],
                                                        triggerAction: [lightweightTrigger, heavyTrigger, matchGradeTrigger],
                                                        underbarrel: [],
                                                        ammunition: [snakeShot],
                                                        rearGrip: [granulated, lockwoodCustom, stippled, FSSRaider, rubberized],
                                                        perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])

public let nineteen_eleven_list = attachments(muzzle: [flashGuard, oilCanSuppressor, muzzleBrake,                                                              compensator, tacticalSuppressor,                                                                           monolithicSuppressor, lightweightSuppressor],
                                                       barrel: [four_five_compact, four_five_matchGrade, nineteen_eleven_stalker],
                                                       laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                       optic: [cronenMiniReflex, solozeroMiniReflex, GIMiniReflex],
                                                       stock: [FORGETacStalker, noStock, FSSCloseQuarters, M_one_three_Skeleton],
                                                       triggerAction: [],
                                                       underbarrel: [],
                                                       ammunition: [tenRounds, fifteenRounds],
                                                       rearGrip: [granulated, stippled, rubberized],
                                                       perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])

public let x_sixteen_list = attachments(muzzle: [flashGuard, monolithicSuppressor, muzzleBrake,                                                               oilCanSuppressor, compensator,                                                                             lightweightSuppressor, tacticalSuppressor],
                                                 barrel: [singuardArmsFeatherweight, vanguardElite, singuardArmsAdvantage],
                                                 laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                 optic: [solozeroMiniReflex, GIMiniReflex, cronenMiniReflex],
                                                 stock: [FORGETacStalker, noStock, FSSCloseQuarters, M_one_three_Skeleton],
                                                 triggerAction: [],
                                                 underbarrel: [],
                                                 ammunition: [seventeenRounds, twentySixRounds],
                                                 rearGrip: [granulated, stippled, x_sixteen_stock, rubberized],
                                                 perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])

public let m_nineteen_list = attachments(muzzle: [flashGuard, monolithicSuppressor, muzzleBrake,                                                               oilCanSuppressor, compensator,                                                                             lightweightSuppressor, tacticalSuppressor],
                                                 barrel: [XRKLSuper, XRKVExtended, A_lightweight],
                                                 laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                 optic: [solozeroMiniReflex, GIMiniReflex, cronenMiniReflex],
                                                 stock: [],
                                                 triggerAction: [lightweightTrigger, heavyTrigger, matchGradeTrigger],
                                                 underbarrel: [],
                                                 ammunition: [twentyOneRounds, thirtyTwoRounds],
                                                 rearGrip: [granulated, stippled, x_sixteen_stock, rubberized],
                                                 perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])

public let point_five_GS_list = attachments(muzzle: [flashGuard, monolithicSuppressor, muzzleBrake,                                                               oilCanSuppressor, compensator,                                                                             lightweightSuppressor, tacticalSuppressor],
                                                     barrel: [FORGETacExtended, FORGETacEnforcer],
                                                     laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                     optic: [operatorReflex, corpCombatHolo, aimOpReflex, APXHolographic, ViperReflex, scoutCombat, VLK, monocleReflex, solozeroMiniReflex, GIMiniReflex, cronenMiniReflex, cronenPro],
                                                     stock: [],
                                                     triggerAction: [lightweightTrigger, heavyTrigger, matchGradeTrigger],
                                                     underbarrel: [],
                                                     ammunition: [twentyOneRounds, thirtyTwoRounds],
                                                     rearGrip: [granulated, stippled, x_sixteen_stock, rubberized],
                                                     perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])


public let renetti_list = attachments(muzzle: [flashGuard, monolithicSuppressor, muzzleBrake,                                                               oilCanSuppressor, desperadoProCompensator,                                                                 lightweightSuppressor, tacticalSuppressor],
                                               barrel: [mkCompetition, mkExtended, mkBurstMod],
                                               laser: [mWLaser_one, mWLaser_five, tacLaser],
                                               optic: [operatorReflex, corpCombatHolo, aimOpReflex, APXHolographic, ViperReflex, scoutCombat, VLK, monocleReflex, solozeroMiniReflex, GIMiniReflex, cronenMiniReflex, cronenPro, XRKPistolScope],
                                               stock: [FTACSatusCS_three, FTACGX, FTACSatusCSX],
                                               triggerAction: [lightweightTrigger, heavyTrigger, matchGradeTrigger],
                                               underbarrel: [],
                                               ammunition: [twentyOneRounds, twentySevenRounds],
                                               rearGrip: [XRKProGrip, XRKSpeedGrip],
                                               perk: [fastMelee, frangibleWounding, fullyLoaded, sleightOfHand, frangibleDisabling, moMoney, recon, heavyHitter, FMJ, akimbo])

public let point357 = weapon(name: ".357", attachments: three_five_seven_list, imageName: "_357", category: handgunCategory)
public let nineteenEleven = weapon(name: "1911", attachments: nineteen_eleven_list, imageName: "1911", category: handgunCategory)
public let X16 = weapon(name: "X16", attachments: x_sixteen_list, imageName: "X16", category: handgunCategory)
public let M19 = weapon(name: "M19", attachments: m_nineteen_list, imageName: "M19", category: handgunCategory)
public let point50_GS = weapon(name: ".50 GS", attachments: point_five_GS_list, imageName: "_50 GS", category: handgunCategory)
public let Renetti = weapon(name: "Renetti", attachments: renetti_list, imageName: "Renetti", category: handgunCategory)

public let Hanguns = [point357, nineteenEleven, X16, M19, point50_GS, Renetti]

public let handgunList = [".357": three_five_seven_list,
                   "1911": nineteen_eleven_list,
                   "X16": x_sixteen_list,
                   "M19": m_nineteen_list,
                   ".50 GS": point_five_GS_list,
                   "Renetti": renetti_list]

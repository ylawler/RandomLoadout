//
//  SMGs.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 10.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit


// ------------------------------------------- MUZZLES ------------------------------------------
public let CQBBreacherDevice = attachment(name: "CQB Breacher Device")
public let ZLRSabre = attachment(name: "ZLR Sabre")

// ------------------------------------------- BARRELS ------------------------------------------
public let four_o_seven_Extended = attachment(name: "407mm Extended Barrel")
public let four_o_seven_lightweight = attachment(name: "407mm lightweight")
public let six_two_two_Long = attachment(name: "622mm Long Barrel")

public let FORGETacRetribution = attachment(name: "FORGE Tac Retribution")
public let FSS_ten_six_pro = attachment(name: "FSS 10.6\" Pro")


public let FSSLight = attachment(name: "FSS Light")
public let monolithicIntegralSuppressor = attachment(name: "Monolithic Integral Suppressor")
public let FSSMini = attachment(name: "FSS Mini")
public let subsonicIntegralSuppressor = attachment(name: "Subsonic Integral Suppressor")


public let FSSStrike = attachment(name: "FSS Strike")
public let FSSRecon = attachment(name: "FSS Recon")
public let FSSSWAT = attachment(name: "FSS SWAT")

public let threeHundredPoly = attachment(name: "300mm Poly Barrel")
public let fourHundredStainlessSteel = attachment(name: "400mm Stainless Steel")
public let hundredFiftyStainlessSteel = attachment(name: "150mm Stainless Steel")

public let ZLRApex = attachment(name: "ZLR 16\" Apex")
public let ZLRDreadfall = attachment(name: "ZLR 18\" Dreadfall")

public let FSSRevolution = attachment(name: "FSS Revolution")
public let ISOCQB = attachment(name: "ISO 140mm CQB")
public let FSSNightshade = attachment(name: "FSS Nightshade")
public let FTACDominator = attachment(name: "FTAC 225mm Dominator")


// ------------------------------------------- LASERS ------------------------------------------

// ------------------------------------------- OPTIC ------------------------------------------
public let integralOptic = attachment(name: "Integral 3.0x Optic")

// ------------------------------------------- STOCK ------------------------------------------
public let FTACUltralightHollow = attachment(name: "FTAC Ultralight Hollow")
public let FORGETacCQBComb = attachment(name: "FORGE Tac CQB Comb")
public let FSSHeavyStockPro = attachment(name: "FSS Heavy Stock Pro")
public let flyStrap = attachment(name: "Fly Strap")

public let standardIsseWoodStock = attachment(name: "Standard-Issue Wood Stock")
public let corvusSkeletonStock = attachment(name: "Corvus Skeleton Stock")

public let FSSGuardian = attachment(name: "FSS Guardian")
public let FTACPrecisionFixedStock = attachment(name: "FTAC Precision Fixed Stock")
public let XRKGenThreeSurvivalist = attachment(name: "XRK Gen III Survivalist Series")

public let FTACCSixCarbine = attachment(name: "FTAC C6 Carbine PRO")
public let ZLRBlade = attachment(name: "ZLR Blade")

public let FTACVagrant = attachment(name: "FTAC Vagrant")
public let ISOCollapsible = attachment(name: "ISO Collapsible")

// ------------------------------------------- UNDERBARREL ------------------------------------------

// ------------------------------------------- AMMUNITION ------------------------------------------
public let five_five_six_NATO_thirtyRounds = attachment(name: "5.56 NATO 30-Round Mags")
public let five_five_six_NATO_sixtyRounds = attachment(name: "5.56 NATO 60-Round Mags")

public let fourtyFiveRounds = attachment(name: "45 Round Mags")
public let ten_auto_thirtyRounds = attachment(name: "10mm Auto 30-Round Mags")

public let AE_thirtyTwoRounds = attachment(name: ".41 AE 32-Round Mags")
public let fourtyRounds = attachment(name: "40 Round Mags")

public let eightyFourRoundHelical = attachment(name: "84 Round Helical Mags")

public let fourtyFivehollowPointTwelveR = attachment(name: "-45 Hollow Point 12-R Mags")
public let fourtyRoundsDrum = attachment(name: "40 Round Drum Mags")

public let fiftyRoundDrums = attachment(name: "50 Round Drums")
// ------------------------------------------- REAR GRIP ------------------------------------------
public let FTACSixtyPolymer = attachment(name: "FTAC 60 Series Polymer")
public let FTACGfiveEXO = attachment(name: "FTAC G-5 EXO")
public let FTACSixtyRubber = attachment(name: "FTAC 60 Series Rubber")

public let FSSViceISO = attachment(name: "FSS Vice ISO Grip")
public let FTACEliteISO = attachment(name: "FTAC Elite ISO Grip")
public let ISOTacForm = attachment(name: "ISO Tac-Form")


// ------------------------------------------- PERK ------------------------------------------






public let AUG_List = attachments(muzzle: [CQBBreacherDevice, tacticalSuppressor, flashGuard,                                                     monolithicSuppressor, muzzleBrake, compensator, lightweightSuppressor],
                                  barrel: [four_o_seven_Extended, four_o_seven_lightweight, six_two_two_Long],
                                  laser: [mWLaser_one, mWLaser_five, tacLaser],
                                  optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid],
                                  stock: [FTACUltralightHollow, FORGETacCQBComb, FSSHeavyStockPro],
                                  triggerAction: [],
                                  underbarrel: [mercForegrip, commandoForegrip, tacticalForegrip, rangerForegrip, operatorForegrip],
                                  ammunition: [thirtyTwoRounds, five_five_six_NATO_thirtyRounds, five_five_six_NATO_sixtyRounds],
                                  rearGrip: [granulated, rubberized, stippled],
                                  perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let P90_List = attachments(muzzle: [tacticalSuppressor, flashGuard, breacherDevice,                                                    monolithicSuppressor, muzzleBrake, compensator,                                                            lightweightSuppressor],
                                  barrel: [FORGETacRetribution, FSS_ten_six_pro],
                                  laser: [mWLaser_one, mWLaser_five, tacLaser],
                                  optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid],
                                  stock: [FORGETacCQBComb, flyStrap, FSSHeavyStockPro],
                                  triggerAction: [],
                                  underbarrel: [stippled, granulated, rubberized],
                                  ammunition: [],
                                  rearGrip: [granulated, rubberized, stippled],
                                  perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])



public let MP5_list = attachments(muzzle: [tacticalSuppressor, flashGuard,                                               breacherDevice, monolithicSuppressor,                                              muzzleBrake, compensator,                                                            lightweightSuppressor],
                                      barrel: [FSSLight, monolithicIntegralSuppressor, FSSMini, subsonicIntegralSuppressor],
                                      laser: [mWLaser_one, mWLaser_five, tacLaser],
                                      optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                      stock: [FORGETacCQBComb, flyStrap, FSSHeavyStockPro],
                                      triggerAction: [],
                                      underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                      ammunition: [fourtyFiveRounds, ten_auto_thirtyRounds],
                                      rearGrip: [granulated, rubberized, stippled],
                                      perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let Uzi_List = attachments(muzzle: [CQBBreacherDevice, tacticalSuppressor, flashGuard, breacherDevice,                                      monolithicSuppressor, muzzleBrake, compensator, lightweightSuppressor],
                                  barrel: [FSSLight, monolithicIntegralSuppressor, FSSMini, subsonicIntegralSuppressor],
                                  laser: [mWLaser_one, mWLaser_five, tacLaser],
                                  optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                  stock: [FORGETacUltralight, standardIsseWoodStock, noStock, FSSCloseQuarters],
                                  triggerAction: [],
                                  underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                  ammunition: [fourtyRounds, fiftyMags, AE_thirtyTwoRounds],
                                  rearGrip: [granulated, rubberized, stippled],
                                  perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let PP19_Bizon_list = attachments(muzzle: [CQBBreacherDevice, tacticalSuppressor, flashGuard,                                        monolithicSuppressor, muzzleBrake, compensator,                                                              lightweightSuppressor],
                                  barrel: [FSSLight, monolithicIntegralSuppressor, FSSMini, subsonicIntegralSuppressor],
                                  laser: [mWLaser_one, mWLaser_five, tacLaser],
                                  optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                  stock: [factoryAluminium, corvusSkeletonStock, noStock, FSSCloseQuarters],
                                  triggerAction: [],
                                  underbarrel: [],
                                  ammunition: [eightyFourRoundHelical],
                                  rearGrip: [granulated, rubberized, stippled],
                                  perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])


public let MP7_List = attachments(muzzle: [tacticalSuppressor, flashGuard, breacherDevice, monolithicSuppressor, muzzleBrake, compensator, lightweightSuppressor],
                                       barrel: [FSSStrike, FSSRecon, FSSSWAT],
                                       laser: [mWLaser_one, mWLaser_five, tacLaser],
                                       optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                       stock: [FORGETacUltralight, FORGETacStalker, FSSCloseQuarters, noStock],
                                       triggerAction: [],
                                       underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                       ammunition: [fiftyMags, sixtyMags],
                                       rearGrip: [granulated, rubberized, stippled],
                                       perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let Striker_45_List = attachments(muzzle: [tacticalSuppressor, flashGuard, breacherDevice, monolithicSuppressor, muzzleBrake, compensator, lightweightSuppressor],
                                                 barrel: [threeHundredPoly, fourHundredStainlessSteel, hundredFiftyStainlessSteel],
                                                 laser: [mWLaser_one, mWLaser_five, tacLaser],
                                                 optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                                 stock: [FSSGuardian, FTACPrecisionFixedStock, XRKGenThreeSurvivalist],
                                                 triggerAction: [],
                                                 underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                                 ammunition: [fourtyFiveRounds, fourtyFivehollowPointTwelveR],
                                                 rearGrip: [FTACSixtyPolymer, FTACGfiveEXO, FTACSixtyRubber],
                                                 perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let Fennec_List = attachments(muzzle: [tacticalSuppressor, flashGuard, CQBBreacherDevice, monolithicSuppressor, muzzleBrake, compensator, ZLRSabre],
                                     barrel: [ZLRApex, ZLRDreadfall],
                                     laser: [mWLaser_one, mWLaser_five, tacLaser],
                                     optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                     stock: [noStock, ZLRBlade, FORGETacCQS, FTACCSixCarbine],
                                     triggerAction: [],
                                     underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                     ammunition: [fourtyRoundsDrum, fourtyFivehollowPointTwelveR],
                                     rearGrip: [granulated, stippled, rubberized],
                                     perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])


public let ISO_List = attachments(muzzle: [tacticalSuppressor, flashGuard, breacherDevice, monolithicSuppressor, muzzleBrake, compensator, lightweightSuppressor],
                                  barrel: [FSSRevolution, ISOCQB, FSSNightshade, FTACDominator],
                                  laser: [mWLaser_one, mWLaser_five, tacLaser],
                                  optic: [operatorReflex, corpCombatHolo, aimOpReflex, GIMiniReflex, scoutCombat, APXHolographic, solozeroMiniReflex, VLK, thermalHybrid, ViperReflex, PBXHolo, solozeroNVGEnhanced, cronenMiniReflex, flipHybrid, monocleReflex, integralOptic, cronenPro, mercThermal, integralHybrid, cantedHybrid],
                                  stock: [FORGETacUltralight, FORGETacStalker, FTACVagrant, ISOCollapsible],
                                  triggerAction: [],
                                  underbarrel: [commandoForegrip, mercForegrip, rangerForegrip, tacticalForegrip, operatorForegrip],
                                  ammunition: [thirtyMags, fiftyRoundDrums],
                                  rearGrip: [FSSViceISO, FTACEliteISO, ISOTacForm],
                                  perk: [FMJ, heavyHitter, recon, frangibleWounding, sleightOfHand, fullyLoaded, moMoney, frangibleDisabling, fastMelee, burst])

public let AUG = weapon(name: "AUG", attachments: AUG_List, imageName: "AUG", category: SMGsCategory)
public let P90 = weapon(name: "P90", attachments: P90_List, imageName: "P90", category: SMGsCategory)
public let MP5 = weapon(name: "M4A1", attachments: MP5_list, imageName: "MP5", category: SMGsCategory)
public let Uzi = weapon(name: "Uzi", attachments: Uzi_List, imageName: "Uzi", category: SMGsCategory)
public let PP19_Bizon = weapon(name: "PP19 Bizon", attachments: PP19_Bizon_list, imageName: "PP19 Bizon", category: SMGsCategory)
public let MP7 = weapon(name: "MP7", attachments: MP7_List, imageName: "MP7", category: SMGsCategory)
public let Striker_45 = weapon(name: "Striker 45", attachments: Striker_45_List, imageName: "Striker 45", category: SMGsCategory)
public let Fennec = weapon(name: "Fennec", attachments: Fennec_List, imageName: "Fennec", category: SMGsCategory)
public let ISO = weapon(name: "ISO", attachments: ISO_List, imageName: "ISO", category: SMGsCategory)

public let SMGs = [AUG, P90, MP5, Uzi, PP19_Bizon, MP7, Striker_45, Fennec, ISO]

let SMGsList = ["AUG": AUG_List,
                "P90": P90_List,
                "MP5": MP5_list,
                "Uzi": Uzi_List,
                "PP19 Bizon": PP19_Bizon_list,
                "MP7": MP7_List,
                "Striker 45": Striker_45_List,
                "Fennec": Fennec_List,
                "ISO": ISO_List]

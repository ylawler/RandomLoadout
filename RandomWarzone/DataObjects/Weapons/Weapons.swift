//
//  Weapons.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 20.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit


//----------------------------------------------------------------------------------------------------------------------------------------------------
// ARS
public let Kilo = weapon(name: "Kilo 141", attachments: kilo_attachments, imageName: "Kilo 141")
public let FAL = weapon(name: "FAL", attachments: FAL_attachments, imageName: "FAL")
public let M4A1 = weapon(name: "M4A1", attachments: m_four_A_one_attachments, imageName: "M4A1")
public let FR_556 = weapon(name: "FR 5.56", attachments: FR_five_five_six_attachments, imageName: "FR 556")
public let Oden = weapon(name: "Oden", attachments: kilo_attachments, imageName: "Oden")
public let M13 = weapon(name: "M13", attachments: kilo_attachments, imageName: "M13")
public let FN_SCAR = weapon(name: "FN SCAR 17", attachments: kilo_attachments, imageName: "FN SCAR 17")
public let AK_47 = weapon(name: "AK-47", attachments: kilo_attachments, imageName: "AK-47")
public let RAM_7 = weapon(name: "RAM-7", attachments: kilo_attachments, imageName: "RAM-7")
public let Grau_556 = weapon(name: "Grau 5.56", attachments: kilo_attachments, imageName: "Grau 556")
public let CR_AMAX = weapon(name: "CR-56 AMAX", attachments: kilo_attachments, imageName: "CR-56 AMAX")
public let AN_94 = weapon(name: "AN-94", attachments: kilo_attachments, imageName: "AN-94")
public let AS_VAL = weapon(name: "AS VAL", attachments: kilo_attachments, imageName: "AS VAL")

public let ARs: [weapon] = [Kilo, FAL, M4A1, Oden, M13, FN_SCAR, AK_47, RAM_7, Grau_556, CR_AMAX, AN_94, AS_VAL]

//----------------------------------------------------------------------------------------------------------------------------------------------------
// SMGs
public let AUG = weapon(name: "AUG", attachments: AUG_List, imageName: "AUG")
public let P90 = weapon(name: "P90", attachments: P90_List, imageName: "P90")
public let MP5 = weapon(name: "M4A1", attachments: MP5_list, imageName: "MP5")
public let Uzi = weapon(name: "Uzi", attachments: Uzi_List, imageName: "Uzi")
public let PP19_Bizon = weapon(name: "PP19 Bizon", attachments: PP19_Bizon_list, imageName: "PP19 Bizon")
public let MP7 = weapon(name: "MP7", attachments: MP7_List, imageName: "MP7")
public let Striker_45 = weapon(name: "Striker 45", attachments: Striker_45_List, imageName: "Striker 45")
public let Fennec = weapon(name: "Fennec", attachments: Fennec_List, imageName: "Fennec")
public let ISO = weapon(name: "ISO", attachments: ISO_List, imageName: "ISO")

public let SMGs: [weapon] = [AUG, P90, MP5, Uzi, PP19_Bizon, MP7, Striker_45, Fennec, ISO]

//----------------------------------------------------------------------------------------------------------------------------------------------------
// Handguns
public let point357 = weapon(name: ".357", attachments: three_five_seven_list, imageName: "_357")
public let nineteenEleven = weapon(name: "1911", attachments: nineteen_eleven_list, imageName: "1911")
public let X16 = weapon(name: "X16", attachments: x_sixteen_list, imageName: "X16")
public let M19 = weapon(name: "M19", attachments: m_nineteen_list, imageName: "M19")
public let point50_GS = weapon(name: ".50 GS", attachments: point_five_GS_list, imageName: "_50 GS")
public let Renetti = weapon(name: "Renetti", attachments: renetti_list, imageName: "Renetti")

public let Hanguns: [weapon] = [point357, nineteenEleven, X16, M19, point50_GS, Renetti]


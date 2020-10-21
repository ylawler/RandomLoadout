//
//  RandomManager.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 20.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit


public struct Category {
    let name: String
    let weaponList: [weapon]
}


//====================================================================================================================================================
public class RandomManager {
    
    var Perks: [String: [Perk]]
    
    
    var primaryCategories: [Category]
    var secondaryCategories: [Category]
    
    var assaultRifleCategory: Category
    var SMGsCategory: Category

    var handgunCategory: Category


    // STILL TO BE DONE
    var ShotgunsCategory: Category
    var LMGsCategory: Category
    var marksmanRiflesCategory: Category
    var sniperRifleCategory: Category
    var meleesCategory: Category
    
    init() {
        
        
        self.assaultRifleCategory = Category(name: "Assault Rifles", weaponList: ARs)
        self.SMGsCategory = Category(name: "SMGs", weaponList: SMGs)
        self.handgunCategory = Category(name: "Handguns", weaponList: Hanguns)


        // STILL TO BE DONE
        self.ShotgunsCategory = Category(name: "Shotguns", weaponList: ARs)
        self.LMGsCategory = Category(name: "LMGs", weaponList: ARs)
        self.marksmanRiflesCategory = Category(name: "Marksman Rifles", weaponList: ARs)
        self.sniperRifleCategory = Category(name: "Sniper Rifles", weaponList: ARs)
        self.meleesCategory = Category(name: "Melees", weaponList: ARs)
        
        
        self.primaryCategories = [assaultRifleCategory, SMGsCategory]
        self.secondaryCategories = [handgunCategory]
        self.Perks = ["Perk 1": perkOneList,
                      "Perk 2": perkTwoList,
                      "Perk 3": perkThreeList]
    }
    
    
    public func createRandomLoadout() -> Loadout {
        print("================================================")
        print("CREATING RANDOM LOADOUT\n")
        let perks: [Perk] = self.getRandomPerks()
        let categories: [Category] = self.getRandomCategories(perks: perks)
        let primaryCategory = categories[0]
        let secondaryCategory = categories[1]
        
        print("\nRANDOM PERKS:\n")
        for perk in perks {
            print(" - \(perk.name)")
        }
        
        print("\nRANDOM CATEGORIES:\n")
        print(" - \(primaryCategory.name)")
        print(" - \(secondaryCategory.name)")
        
        let randomWeapons = self.getRandomWeapons(perks: perks, primaryCategory: primaryCategory, secondaryCategory: secondaryCategory)
        
        let randomPrimary = randomWeapons[0]
        let randomSecondary = randomWeapons[1]
        
        print("\nRANDOM PRIMARY AND SECONDARY WEAPONS:\n")
        print(" - \(randomPrimary.name) with \(randomPrimary.setAttachments.count) attachments:\n")
        randomPrimary.displayAttachments()
        print()
        print(" - \(randomSecondary.name) with \(randomSecondary.setAttachments.count) attachments:\n")
        randomSecondary.displayAttachments()
        
        
        let randomLethal = self.getRandomFrom(array: lethalsList) as! Lethal
        let randomTactical = self.getRandomFrom(array: tacticalsList) as! Tactical
        
        print("\nRANDOM LETHAL AND TACTICAL:\n")
        print(" - \(randomLethal.name)")
        print(" - \(randomTactical.name)")
        
        return Loadout(perks: perks, primary: randomPrimary, primaryCategory: primaryCategory.name, secondary: randomSecondary, secondaryCategory: secondaryCategory.name, lethal: randomLethal, tactical: randomTactical)
        
    }
    
    private func getRandomPerks() -> [Perk] {
        var randomPerks: [Perk] = []
        for perk in self.Perks {
            randomPerks.append(self.getRandomFrom(array: perk.value) as! Perk)
        }
        return randomPerks
    }
    
    private func getRandomFrom(array: [Any]) -> Any {
        return array[Int.random(in: 0..<array.count)]
    }
    
    private func getRandomCategories(perks: [Perk]) -> [Category] {
        var secondary: Category
        let primary = self.getRandomFrom(array: self.primaryCategories) as! Category
        
        if perks[1].name == "Overkill" {
            // We need to select two guns from primary weapon categories
            // Can be two assault rifles as well, however, not the same assault rifle twice
            secondary = self.getRandomFrom(array: primaryCategories) as! Category

        } else {
            secondary = self.getRandomFrom(array: secondaryCategories) as! Category
        }
        return [primary, secondary]
    }
    
    private func getRandomWeapons(perks: [Perk], primaryCategory: Category, secondaryCategory: Category) -> [weapon] {
        
        let randomPrimaryWeapon = self.getRandomFrom(array: primaryCategory.weaponList) as! weapon
        var randomSecondaryWeapon: weapon!
        
        if perks[1].name == "Overkill" {
            var secondaryWeaponFound: Bool = false
           
            while !secondaryWeaponFound {
                randomSecondaryWeapon = self.getRandomFrom(array: secondaryCategory.weaponList) as? weapon
                
                if randomSecondaryWeapon.name != randomPrimaryWeapon.name {
                    secondaryWeaponFound = true
                }
            }
        } else {
            randomSecondaryWeapon = self.getRandomFrom(array: secondaryCategory.weaponList) as? weapon
        }
        
        print("=================================================================================================")
        print("RANDOMIZING PRIMARY: \(randomPrimaryWeapon.name)")
        randomPrimaryWeapon.randomizeAttachments()
        
        
        print("=================================================================================================")
        print("RANDOMIZING SECONDARY: \(randomSecondaryWeapon.name)")
        randomSecondaryWeapon.randomizeAttachments()
        
//        print("Returning: \(randomPrimaryWeapon.name), \(randomSecondaryWeapon.name)")
        return [randomPrimaryWeapon, randomSecondaryWeapon]
    }
    
    
}

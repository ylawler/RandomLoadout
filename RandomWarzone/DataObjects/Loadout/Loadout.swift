//
//  Loadout.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 11.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

public let assaultRifleCategory = "Assault Rifles"
public let SMGsCategory = "SMGs"
public let ShotgunsCategory = "Shotguns"
public let LMGsCategory = "LMGs"
public let marksmanRiflesCategory = "Marksman Rifles"
public let sniperRifleCategory = "Sniper Rifles"
public let meleesCategory = "Melees"
public let handgunCategory = "Handguns"

public class weapon {
    
    var name: String
    var allAttachments: Attachments
    var imageName: String
    var setAttachments: [String: attachment] = [:]
    var category: String
    
    
    init(name: String, attachments: attachments, imageName: String, category: String) {
        self.name = name
        self.allAttachments = Attachments(attachments: attachments)
        self.imageName = imageName
        self.category = category
    }
    
    func displayAttachments() {
        for attachment in self.setAttachments {
            print("\(attachment.key) - \(attachment.value.name)")
        }
    }
    
    func randomizeAttachments() {
        // Get a random number between 1 and 5 -> Determine how many attachments
        let numberOfRandomAttachments = Int.random(in: 0...5)
        
        
        // For the above number of times, choose a random attachment category
        print("-------------------------------------------------")
        print("number of random attachments: \(numberOfRandomAttachments)\n")
        if numberOfRandomAttachments == 0 {
            // No attachments...
        } else {
            
            var updatedAttachmentList = ["Muzzle", "Barrel", "Laser", "Optic", "Stock", "Trigger Action", "Underbarrel", "Ammunition", "Rear Grip", "Perk"]
            
            for i in 1...numberOfRandomAttachments {
                print("attachment no. : \(i) / \(numberOfRandomAttachments)")
                var randomAttachmentKey = ""
                var newAttachmentFound = false
                
                while newAttachmentFound == false {
                    randomAttachmentKey = updatedAttachmentList[Int.random(in: 0..<updatedAttachmentList.count)]
                    if !self.setAttachments.keys.contains(randomAttachmentKey) && self.allAttachments.allAttachments[randomAttachmentKey] != [] {
                        newAttachmentFound = true
                        if let idx = updatedAttachmentList.firstIndex(of: randomAttachmentKey) {
                            print("set - \(updatedAttachmentList[idx])")
                            updatedAttachmentList.remove(at: idx)
                            print(updatedAttachmentList)
                        }
                    } else {
                        if let idx = updatedAttachmentList.firstIndex(of: randomAttachmentKey) {
                            print("removing: \(updatedAttachmentList[idx])")
                            updatedAttachmentList.remove(at: idx)
                            print(updatedAttachmentList)
                        }
                    }
                }
                self.setRandomAttachment(for: randomAttachmentKey)
            }
        }
    }
    
    func setRandomAttachment(for key: String) {
        // For each random category, choose a random attachment
        
        
        if let attachmentList = self.allAttachments.allAttachments[key] {
            let randomAttachment = attachmentList[Int.random(in: 0..<attachmentList.count)]
            print("Setting \(key) attachment to \(randomAttachment.name)\n")
            self.setAttachments[key] = randomAttachment
        }
    }
        
}



class Loadout {
    
    var primaryWeapon: weapon
    var secondaryWeapon: weapon
    var perks: [Perk]
    var lethal: Lethal
    var tactical: Tactical
    
    init(perks: [Perk], primary: weapon, secondary: weapon, lethal: Lethal, tactical: Tactical) {
        self.primaryWeapon = primary
        self.secondaryWeapon = secondary
        self.perks = perks
        self.lethal = lethal
        self.tactical = tactical
    }
    
    func displayLoadout() {
        print("Primary Weapon\n------------------\n")
        print("\(self.primaryWeapon.category)\n")
        print("\(self.primaryWeapon.name)\n")
        self.primaryWeapon.displayAttachments()
        
        print("\nSecondary Weapon\n------------------\n")
        print("\(self.secondaryWeapon.category)\n")
        print("\(self.secondaryWeapon.name)\n")
        self.secondaryWeapon.displayAttachments()
        
    }
    
    
}

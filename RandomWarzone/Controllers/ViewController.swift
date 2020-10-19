//
//  ViewController.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 09.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
 
    var RandomLoadout: Loadout?
    
    
    
    let perkOneCategory = "Perk 1"
    let perkTwoCategory = "Perk 2"
    let perkThreeCategory = "Perk 3"
    
    var MainDictionary: [String: [weapon]] = [:]
    var randomSecondary: weapon?
    var randomPrimary: weapon?
    
    var WeaponsDict: [String: [String: attachments]] = [:]
    var WeaponsClassDict: [String: AnyClass] = [:]
    var PerksDict: [String: [Perk]] = [:]
    
    var primaryCategories: [String] = []
    var secondaryCategories: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.PerksDict[perkOneCategory] = perkOneList
        self.PerksDict[perkTwoCategory] = perkTwoList
        self.PerksDict[perkThreeCategory] = perkThreeList
        
        // Setup the Weapons Dictionary containing the list of weapons and all attachments for the corresponding weaponClassCategory
        self.WeaponsDict[assaultRifleCategory] = ARList
        self.WeaponsDict[SMGsCategory] = SMGsList
        self.WeaponsDict[handgunCategory] = handgunList
        
        self.MainDictionary[assaultRifleCategory] = ARs
        self.MainDictionary[SMGsCategory] = SMGs
        self.MainDictionary[handgunCategory] = Hanguns
        
        self.primaryCategories = [assaultRifleCategory, SMGsCategory]
        self.secondaryCategories = [handgunCategory]
        
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }

    
    func getRandomPerks() -> [Perk] {
        // ----------------------------------------------------------------------------------------------------------------------------------
        // First Setup Perks
        let randomFirstPerk = perkOneList[Int.random(in: 0..<perkOneList.count)]
        let randomSecondPerk = perkTwoList[Int.random(in: 0..<perkTwoList.count)]
        let randomThirdPerk = perkThreeList[Int.random(in: 0..<perkThreeList.count)]
        
        return [randomFirstPerk, randomSecondPerk, randomThirdPerk]
    }
    
    func getRandomCategories(withOverkill: Bool) -> [String] {
        var secondary: String
        let firstPrimary = primaryCategories[Int.random(in: 0..<primaryCategories.count)]
        
        if withOverkill {
            // We need to select two guns from primary weapons
            secondary = primaryCategories[Int.random(in: 0..<primaryCategories.count)]

        } else {
            secondary = secondaryCategories[Int.random(in: 0..<secondaryCategories.count)]
        }
        print("Returning \(firstPrimary), \(secondary)")
        return [firstPrimary, secondary]
    }
    
    func setupPrimaryAndSecondaryWeapon(isOverkill: Bool) {
        
        let RandomCategories = self.getRandomCategories(withOverkill: isOverkill)
        
        
        let PrimaryWeaponCategory = RandomCategories[0]
        let SecondaryWeaponCategory = RandomCategories[1]
            
//        print("Random Categories chosen: \(PrimaryWeaponCategory), \(SecondaryWeaponCategory)")
//
//        if let primaryList = self.MainDictionary[PrimaryWeaponCategory], let secondaryList = self.MainDictionary[SecondaryWeaponCategory] {
//            for item in primaryList {
//                print(item.name)
//            }
//            print("")
//            for item_ii in secondaryList {
//                print(item_ii.name)
//            }
//        }
//
        guard let firstPrimaryWeaponList = self.MainDictionary[PrimaryWeaponCategory] else { return }
        guard let secondPrimaryWeaponList = self.MainDictionary[SecondaryWeaponCategory] else { return }
//        print("Primary weapon list:")
//        for firstPrimaryWeapon in firstPrimaryWeaponList {
//            print(firstPrimaryWeapon.name)
//        }
//        
//        print("Second Primary weapon list:")
//        for secondPrimaryWeapon in secondPrimaryWeaponList {
//            print(secondPrimaryWeapon.name)
//        }
        
        self.randomPrimary = self.getRandomWeaponFrom(list: firstPrimaryWeaponList)
        
        
        var randomSecondaryFound: Bool = false
        if isOverkill {
            while randomSecondaryFound == false {
                self.randomSecondary = self.getRandomWeaponFrom(list: secondPrimaryWeaponList)

                
                if self.randomSecondary!.name != randomPrimary!.name {
                    randomSecondaryFound = true
                }
            }
        } else {
            self.randomSecondary = self.getRandomWeaponFrom(list: secondPrimaryWeaponList)
        }
        
        
        
        
        self.randomPrimary!.randomizeAttachments()
        self.randomSecondary!.randomizeAttachments()
        
    }
    func getRandomWeaponFrom(list: [weapon]) -> weapon {
        return list[Int.random(in: 0..<list.count)]
    }
    
    
    func getStringArray(fromDict: [String: attachments]) -> [String] {
        var res: [String] = []
        for entry in fromDict {
            res.append(entry.key)
        }
        return res
    }

    
    func generateRandomLoadout(completion: (Bool, Loadout?) -> Void) {
        let randomPerks = self.getRandomPerks()
        self.setupPrimaryAndSecondaryWeapon(isOverkill: randomPerks[1].name == "Overkill")
        // Get random lethal and tactical
        let randomLethal = lethalsList[Int.random(in: 0..<lethalsList.count)]
        let randomTactical = tacticalsList[Int.random(in: 0..<tacticalsList.count)]
        
        if self.randomPrimary != nil && self.randomSecondary != nil {
            
            let loadout = Loadout(perks: randomPerks, primary: self.randomPrimary!, secondary: self.randomSecondary!, lethal: randomLethal, tactical: randomTactical)
            
            completion(true, loadout)
           
        } else {
            completion(false, nil)
        }
    }

    @IBAction func generateTapped(_ sender: UIButton) {
        
        self.generateRandomLoadout { (successfull, loadout) in
            if successfull {
                if let randomLoadout = loadout {
                    self.RandomLoadout = randomLoadout
                    self.performSegue(withIdentifier: "showGameSegue", sender: self)
                } else {
                    print("ERROR with random Loadout creation")
                }
            } else {
                print("Unsuccessfull with generating random loadout")
            }
        }
        
        
        
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showGameSegue" {
            let dest = segue.destination as! GameCollectionViewController
            if let randomLoadout = self.RandomLoadout {
                dest.LoadoutClass = randomLoadout
                self.randomPrimary = nil
                self.randomSecondary = nil
            }
        }
        
    }
    
}



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
    
    var ARs: [AssaultRifle] = []
    
    var WeaponsDict = ["Assault Rifles": ARList]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        setupData()
    }
    
    func setupData() {
        // First Setup Perks
//        let perks = RandomPerks()
        
        
        
        
        // Setup Random Primary Weapon from
//        let primaryCategories = ["Assault Rifle", "SMGs", "Shotguns", "LMGs", "Marksman Rifles", "Sniper Rifles", "Melees"]
        let temporaryPrimaryCategory = "Assault Rifles"
        //
        var weaponKeys: [String] = []
        let randomList = self.WeaponsDict[temporaryPrimaryCategory]?.keys
        
        for j in randomList! {
            weaponKeys.append(j)
        }
        
        
        let randomWeaponName = weaponKeys[Int.random(in: 0..<weaponKeys.count)]
        
        if temporaryPrimaryCategory == "Assault Rifles" {
            let randomPrimaryWeapon = AssaultRifle(name: randomWeaponName, attachments: (self.WeaponsDict[temporaryPrimaryCategory]?[randomWeaponName])!)
            
            print("Random Loadout Primary Weapon: \(randomPrimaryWeapon.name)\n")
            for a in randomPrimaryWeapon.existingAttachments {
                print("\(a.key) - \(a.value.name)")
            }
        }
        
//        let kilo = AssaultRifle(name: "Kilo", attachments: kilo_attachments)
//        let m_thirteen = AssaultRifle(name: "M13", attachments: m_thirteen_attachments)
//        let FAL = AssaultRifle(name: "FAL", attachments: FAL_attachments)
//        let m_four_A_one = AssaultRifle(name: "M4A1", attachments: m_four_A_one_attachments)
//        let FR_five_five_six = AssaultRifle(name: "FR 5.56", attachments: FR_five_five_six_attachments)
        
        
//        self.ARs = [kilo, FAL, m_thirteen, m_four_A_one, FR_five_five_six]
        
        
        
        
        
    }


    @IBAction func generateTapped(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "showGameSegue", sender: self)
        self.setupData()
    }
}


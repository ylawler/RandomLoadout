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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        //["Barrel", "Laser", "Muzzle", "Optic", "Rear Grip"]
    }


    @IBAction func generateTapped(_ sender: UIButton) {
//        self.RandomLoadout = RandomManager().createRandomLoadout()
//        self.performSegue(withIdentifier: "showGameSegue", sender: self)
        
    }
    
    /*
     
     finally managed to fall asleep, 4:30, worst dream after I lefft
     We had a massive fight, patrick there being a dick
     I hated her after the fight, didnt talk to her
     by not talking, calling off the engagement
     not sure if same dream or other, mom saying to call it off
     
     woke up and I'm gone...
     felt really real (another dream where I was still there, getting ready and leaving)
     
     
     also dreamt all flights got cancled, I wasn#t allowed to fliy without injection
     
     
     
     */
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
//        if segue.identifier == "showGameSegue" {
//            let dest = segue.destination as! GameCollectionViewController
//            if let randomLoadout = self.RandomLoadout {
//                dest.LoadoutClass = randomLoadout
//                self.RandomLoadout = nil
//            }
//        }
        
    }
    
}



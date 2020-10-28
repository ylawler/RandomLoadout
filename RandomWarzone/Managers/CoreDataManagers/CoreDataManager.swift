//
//  CoreDataManager.swift
//  RandomWarzone
//
//  Created by Yannick Lawler on 24.10.20.
//  Copyright © 2020 YannickLawler. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func savePlayer() {
        
    }
    
    func saveNewSquad(squadName: String, squadImage: UIImage, squadPlayers: [Player], completion: (Bool) -> Void) {
        
        
        
    }
    
    func getPlayerFromId(id: String) -> Player? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let filter = NSPredicate(format: "id CONTAINS '\(id)'")
        request.predicate = filter
        
        do {
            let player = try context.fetch(request)
            return player.first as? Player
        } catch let err {
            print("Error getting playerFromId: \(err)")
            return nil
        }
    }
    
    
    func loadCoreData(completion: (Bool, [Player]?, [Squad]?, [Regiment]?) -> Void) {
        do {
            let players = try context.fetch(Player.fetchRequest()) as! [Player]
            
            let squads = try context.fetch(Squad.fetchRequest()) as! [Squad]
            
            let regiments = try context.fetch(Regiment.fetchRequest()) as! [Regiment]
            
            
            print("Loaded Core Data:")
            print("players: \(players)")
            print("squads: \(squads)")
            print("regiments: \(regiments)")
            
            completion(true, players, squads, regiments)
            
        } catch let err {
            completion(false, nil, nil, nil)
            print(err)
        }
    }
    
    
    
    
    func getPlayer(with playerId: String) -> Player? {
        do {
            let request = Player.fetchRequest() as NSFetchRequest<Player>
            
            let idFilter = NSPredicate(format: "id CONTAINS '\(playerId)'")
            request.predicate = idFilter
            
            
            let player = try context.fetch(request)
            print("\(player) from \(playerId) request")
            
            if player != [] {
                return player[0]
            }
            return nil
            
        } catch let err {
            print("ERROR getting Player: \(err)")
        }
        return nil
    }
    
    
    
    func checkIfExists(id: String, entityName: String) -> Bool {//PlayerId: String? = nil, SquadId: String? = nil, RegimentId: String? = nil) -> Bool {
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "\(entityName)")
        let filter = NSPredicate(format: "id CONTAINS '\(id)'")
        request.predicate = filter
        do {
            
            var fetchResults: [AnyObject] = []
            
            if entityName == "Player" {
                fetchResults = try self.context.fetch(request) as! [Player]
            } else if entityName == "Squad" {
                fetchResults = try self.context.fetch(request) as! [Squad]
            } else if entityName == "Regiment" {
                fetchResults = try self.context.fetch(request) as! [Regiment]
            }
            
            print(fetchResults)
            
            for result in fetchResults {
                print("Checking resultId: \(String(describing: result.id)) == \(id)")
                if result.id == id {
                    // Player exists
                    return true
                }
            }
            
            return false
            
        } catch let err {
            print(err)
            return false
        }
        
    }
    
    
    
    func deleteAll() {
        do {
            
            let players = try context.fetch(Player.fetchRequest()) as? [Player]
            
            let squads = try context.fetch(Squad.fetchRequest()) as? [Squad]
            
            let regiments = try context.fetch(Regiment.fetchRequest()) as? [Regiment]
            
            for player in players! {
                context.delete(player)
            }
            for squad in squads! {
                context.delete(squad)
            }
            for regiment in regiments! {
                context.delete(regiment)
            }
            
            try context.save()
            
            
        } catch let err {
            print(err)
        }
    }
    
    
}

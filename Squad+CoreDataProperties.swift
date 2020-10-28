//
//  Squad+CoreDataProperties.swift
//  
//
//  Created by Yannick Lawler on 28.10.20.
//
//

import Foundation
import CoreData


extension Squad {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Squad> {
        return NSFetchRequest<Squad>(entityName: "Squad")
    }

    @NSManaged public var id: String?
    @NSManaged public var img: Data?
    @NSManaged public var name: String?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension Squad {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

//
//  Player+CoreDataProperties.swift
//  
//
//  Created by Yannick Lawler on 28.10.20.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var id: String?
    @NSManaged public var img: Data?
    @NSManaged public var isOnline: Bool
    @NSManaged public var isReady: Bool
    @NSManaged public var name: String?
    @NSManaged public var regiment: Regiment?
    @NSManaged public var squad: Squad?

}

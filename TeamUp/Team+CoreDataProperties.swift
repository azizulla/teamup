//
//  Team+CoreDataProperties.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-01.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        
        let request = NSFetchRequest<Team>(entityName: "Team")
        request.sortDescriptors = [NSSortDescriptor(key: "teamName", ascending: true)]
        return request

    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var teamName: String?
    @NSManaged public var teamNumberOfPlayers: String?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension Team {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Players)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Players)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

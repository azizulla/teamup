//
//  Players+CoreDataProperties.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-01.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import CoreData


extension Players {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        let request = NSFetchRequest<Players>(entityName: "Players")
        request.sortDescriptors = [NSSortDescriptor(key: "playerFirstName", ascending: true)]
        return request

    }

    @NSManaged public var playerEmail: String?
    @NSManaged public var playerFirstName: String?
    @NSManaged public var playerJerseyNumber: String?
    @NSManaged public var playerLastName: String?
    @NSManaged public var playerPosition: String?
    @NSManaged public var team: NSSet?


}

//
//  InvitationEntity+CoreDataProperties.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-01.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import CoreData


extension InvitationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InvitationEntity> {
        return NSFetchRequest<InvitationEntity>(entityName: "InvitationEntity")
    }

    @NSManaged public var invited: Bool
    @NSManaged public var invitedPlayers: Players?

}

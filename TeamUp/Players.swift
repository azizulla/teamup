//
//  Players.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-23.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import FirebaseDatabase


class Players: NSObject{
    
    var ref:DatabaseReference?
   // let ownedPartiesKeys: [String: Any]?
   // let attendingPartiesKeys: [String: Any]?

    var firstName: String?
    var lastName: String?
    var email: String?
    var position: String?
    var squad: String?
    var uid: String!
    
   // var profileImage: image
    var profileImageUrl: String?
    
    var teamplayer = [Team]()
    
  //  var favorite: String
    
    init(firstName: String, lastName: String, email: String, position: String, squad: String, userID: String, teamplayer: [Team], profileImageUrl: String) {
        
   
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.position = position
        self.squad = squad
       // self.team = team
        self.profileImageUrl = profileImageUrl
        self.uid = userID
        self.ref = nil
        
        self.teamplayer = (teamplayer )
        
    }
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        //teamName = snapshotValue["name"] as? String
        firstName = snapshotValue["firstName"] as? String
        lastName = snapshotValue["lastName"] as? String
        email = snapshotValue["email"] as? String
        position = snapshotValue["position"] as? String
        squad = snapshotValue["squad"] as? String
        uid = snapshotValue["uid"] as? String
        profileImageUrl = snapshotValue["profileImageUrl"] as? String
     //    team = (snapshotValue["team"] as? String)!
        
  //      team = snapshotValue["team"] as? String
    
    //    teamplayer = snapshotValue["team"] as! [Team]
        
        print(firstName ?? "players", squad ?? 12)
        
        ref = snapshot.ref
    }
    
    
}



//
//  Players.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-23.
//  Copyright © 2017 Aziz. All rights reserved.
//



import Foundation
import Foundation
import FirebaseDatabase

class Players{
    
    var ref:DatabaseReference?
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var position: String?
    var squad: String?
    
  //  var favorite: String
    
    init(firstName: String, lastName: String, email: String, position: String, squad: String) {
        
   
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.position = position
        self.squad = squad
        
       
        
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        //teamName = snapshotValue["name"] as? String
        firstName = snapshotValue["firstName"] as? String
        lastName = snapshotValue["lastName"] as? String
        email = snapshotValue["email"] as? String
        position = snapshotValue["position"] as? String
        squad = snapshotValue["squad"] as? String
        
        
        print(firstName ?? "players", squad ?? 12)
        
        ref = snapshot.ref
    }
    
}



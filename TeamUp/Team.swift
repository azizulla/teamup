import Foundation
import FirebaseDatabase

class Team{

    var ref:DatabaseReference?
    var teamName: String?
    var squad: String?
    
    
    init(teamName: String, squad: String) {

        self.teamName = teamName
        self.squad = squad
       
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        teamName = snapshotValue["name"] as? String
        squad = snapshotValue["squad"] as? String
   
        
        print(teamName ?? "team", squad ?? 12)
        
        ref = snapshot.ref
    }
    
}


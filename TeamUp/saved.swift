//
//  File.swift
//  TeamUp
//
//  Created by Aziz on 2018-01-28.
//  Copyright © 2018 Aziz. All rights reserved.
//


import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth


class ProfileTeamListController2: UITableViewController {
    
    var selectedPost: Players!
    
    var copyArray = [String]()
    // var copyTeamArray = [String]()
    
    var players = [Players]()
    var team = [Team]()
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView.dataSource = dataSource
        ref = Database.database().reference()
        startObservingDatabase()
        
    }
    
    // --- getting data
    func startObservingDatabase () {
        let userID = Auth.auth().currentUser?.uid
        let currentPlayer = selectedPost.uid
        
        ref?.child("Players").child(currentPlayer!).child("team").observe(.value, with: { (snapshot ) in
            //  var newItems = [copyArray]
            
            for itemSnapShot in snapshot.children {
                let item = Team(snapshot: snapshot as! DataSnapshot)
                
                let value = snapshot.value as? NSDictionary
                
                // let teamName = value?["name"] as? String
                
                //  value?.setValue(teamName, forKey: "key")
                let findteam = value?.allKeys
                self.copyArray = findteam as! [String]
                
                
                let post = ["/players/test" : self.copyArray]
                // let post = ["/players/\(String(describing: currentPlayer))": currentPlayer]
                self.ref?.child("Player").child(userID!).updateChildValues(post)
                
            }
            
            
            //    self.players = newItems
            self.tableView.reloadData()
            
            
            
            
        })
        
    }
    // load team data
    /*
     func startObservingDatabase () {
     let userID = Auth.auth().currentUser?.uid
     let currentPlayer = selectedPost.uid
     
     ref?.child("Players").child(currentPlayer!).child("team").observe(.value, with: { (snapshot) in
     var newItems = self.copyArray
     
     // for itemSnapShot in snapshot.children {
     let item = Team(snapshot: snapshot as! DataSnapshot)
     //let teamName = item.teamName
     
     
     let value = snapshot.value as? NSDictionary
     // let teamName = value?["firstName"] as? String
     let key = snapshot.key
     value?.setValue(key, forKey: "firstName")
     
     
     //    newItems.append(teamName!)self.copyArray = findteam as! [String]
     
     //   self.copyArray = teamName
     
     
     let post = ["/players/test" : value]
     // let post = ["/players/\(String(describing: currentPlayer))": currentPlayer]
     self.ref?.child("Player").child(userID!).updateChildValues(post)
     
     //}
     
     
     //         self.team = newItems
     self.tableView.reloadData()
     
     })
     }
     
     
     
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //    guard let section = fetchedResultsController.sections?[section] else { return 0 }
        //    return section.numberOfObjects
        print(copyArray.count)
        return copyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerscell = tableView.dequeueReusableCell(withIdentifier: "ProfileTeamCell", for: indexPath) as? ProfileTeamCell
        
        let keys = Array (copyArray)
        playerscell?.profileTeamList.text = String(keys[indexPath.row])
        
        
        
        //  let object = team[indexPath.row]
        //  playerscell?.profileTeamList.text = object.teamName
        
        // playerscell?.profileImage.layer.cornerRadius = 5
        
        return playerscell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}


/*
 func startObservingDatabase () {
 let userID = Auth.auth().currentUser?.uid
 let currentPlayer = selectedPost.uid
 
 ref?.child("Players").child(currentPlayer!).child("team").observe(.value, with: { (snapshot ) in
 //          var newItems = [Players]()
 for itemSnapShot in snapshot.children {
 let item = Team(snapshot: snapshot as! DataSnapshot)
 
 let teamName = item.teamName
 //newItems.append(item)
 
 //        let key = snapshot.key
 
 
 let value = snapshot.value as? NSDictionary
 
 // let teamName = value?["name"] as? String
 
 value?.setValue(teamName, forKey: "key")
 let findteam = value?.allKeys
 self.copyArray = findteam as! [String]
 
 
 let post = ["/players/test" : value]
 // let post = ["/players/\(String(describing: currentPlayer))": currentPlayer]
 self.ref?.child("Player").child(userID!).updateChildValues(post)
 }
 
 
 
 //    self.players = newItems
 self.tableView.reloadData()
 
 
 
 
 })
 
 }
 
 
 */

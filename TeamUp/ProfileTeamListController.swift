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


class ProfileTeamListController: UITableViewController {

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
                
                var newItems = [Team]()
                
                for itemSnapShot in snapshot.children {
                    let item = Team(snapshot: itemSnapShot as! DataSnapshot)
                    newItems.append(item)
                }
                
                self.team = newItems
                self.tableView.reloadData()
                
        })
 
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerscell = tableView.dequeueReusableCell(withIdentifier: "ProfileTeamCell", for: indexPath) as? ProfileTeamCell
        
        //let keys = Array (copyArray)
        //playerscell?.profileTeamList.text = String(keys[indexPath.row])
        
       
      
        let object = team[indexPath.row]
        playerscell?.profileTeamList.text = object.teamName
    
        
        return playerscell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
//-- Passing data to team profile view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPlayerInfo"{
            
            
            guard let detailVC = segue.destination as? TeamProfileView, let indexPath = tableView.indexPathForSelectedRow else{ return }
            
            detailVC.selectedTeam = team[indexPath.row]
            
            
        }
    }
    


       
}




//
//  TeamListController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase

class TeamListController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext


    var players = [Players]()
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.dataSource = dataSource
        ref = Database.database().reference()
        
        startObservingDatabase()
        
    }
    func startObservingDatabase () {
        ref?.child("Players").observe(.value, with: { (snapshot) in
            var newItems = [Players]()
            
            for itemSnapShot in snapshot.children {
                let item = Players(snapshot: itemSnapShot as! DataSnapshot)
                newItems.append(item)
            }
            
            self.players = newItems
            self.tableView.reloadData()
            
        })
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //    guard let section = fetchedResultsController.sections?[section] else { return 0 }
        //    return section.numberOfObjects
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerscell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell", for: indexPath) as? PlayersCell
        
        let object = players[indexPath.row]
        playerscell?.friendNameLabel.text = object.firstName
        
        return playerscell!
    }
    

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPlayerInfo"{
            
            
            guard let detailVC = segue.destination as? PlayerProfileViewController, let indexPath = tableView.indexPathForSelectedRow else{ return }
            
            detailVC.selectedPost = players[indexPath.row]
            
            
        }
    }
    
}




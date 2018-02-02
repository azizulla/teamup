//
//  SearchTeamList.swift
//  TeamUp
//
//  Created by Aziz on 2018-01-28.
//  Copyright © 2018 Aziz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth


class SearchViewController: UITableViewController, UISearchResultsUpdating  {
    
    
   let searchController = UISearchController(searchResultsController: nil)
    
    
    var players = [NSDictionary?]()
    var filteredUsers = [NSDictionary?]()
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView.dataSource = dataSource
        ref = Database.database().reference()
        startObservingDatabase()
        
        
    }
    func startObservingDatabase () {
        
        let userID = Auth.auth().currentUser?.uid
        
        ref?.child("Players").queryOrdered(byChild: "name").observe(.childAdded, with: { (snapshot) in
            
            
            let key = snapshot.key
            let snapshot = snapshot.value as? NSDictionary
            snapshot?.setValue(key, forKey: "uid")
            
            if(key == userID)
            {
                print("Same as logged in user, so don't show!")
            }
            else
            {
                self.players.append(snapshot)
                //insert the rows
            //    self.followPlayersTabelView.insertRows(at: [IndexPath(row:self.players.count-1,section:0)], with: UITableViewRowAnimation.automatic)
            }
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //    guard let section = fetchedResultsController.sections?[section] else { return 0 }
        //    return section.numberOfObjects
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredUsers.count
        }
        // return self.usersArray.count
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerscell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell", for: indexPath) as? PlayersCell
        
        // let object = players[indexPath.row]
        // playerscell?.friendNameLabel.text = object.firstName
        
        let user : NSDictionary?
        
        if searchController.isActive && searchController.searchBar.text != ""{
            
            user = filteredUsers[indexPath.row]
        }
        else
        {
            user = self.players[indexPath.row]
        }
        playerscell?.friendNameLabel.text = user?["firstName"] as? String
        
        //cell.textLabel?.text = user?["name"] as? String
        // cell.detailTextLabel?.text = user?["handle"] as? String
        
        return playerscell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // --- search
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContent(searchText: self.searchController.searchBar.text!)
        
    }
    
    func filterContent(searchText:String)
    {
        self.filteredUsers = self.players.filter{ user in
            
            let username = user?["firstName"] as? String
            
            return(username?.lowercased().contains(searchText.lowercased()))!
            
        }
        
        tableView.reloadData()
    }
    
    // --- MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPlayerInfo"{
            
            
            guard let detailVC = segue.destination as? PlayerProfileViewController, let indexPath = tableView.indexPathForSelectedRow else{ return }
            
            detailVC.selectedPost = players[indexPath.row]
            
            
            
            
            
        }
    }
    
}


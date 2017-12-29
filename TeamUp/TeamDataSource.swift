//
//  DataSource.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class TeamDataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView

 

    var players = [Players]()
    

   
    
    init(tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        
    }

    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      
        //return fetchedResultsController.sections?.count ?? 0
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    guard let section = fetchedResultsController.sections?[section] else { return 0 }
    //    return section.numberOfObjects
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerscell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell", for: indexPath) as? PlayersCell
       //  let players = fetchedResultsController.object(at: indexPath)
        
        let object = players[indexPath.row]
      // cell.textLabel?.text = object.teamName
        playerscell?.friendNameLabel.text = object.firstName
        //playerscell?.friendNameLabel?.text = players.playerFirstName
        
       
        
        return playerscell!
       // return configureCell(cell, at: indexPath)
    }
    
   /*   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        let players = self.players(at: indexPath)
        context.delete(players)
        context.saveChanges()
        
        
    }
    
    
    
  private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let players = fetchedResultsController.object(at: indexPath)
        
        //cell.textLabel?.text = team.teamName
        
        //cell.textLabel?.text = team.teamName
     //   cell.textLabel?.text = players.playerFirstName
        
        return cell
    }*/
    
}


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

class DataSource: NSObject, UITableViewDataSource {

    private let tableView: UITableView
    private let context: NSManagedObjectContext
    
    
    
    
    
    lazy var fetchedResultsController: TeamFetchedResultsController = {
        return TeamFetchedResultsController(managedObjectContext: self.context, tableView: self.tableView)
    }()
    
    init(tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        self.context = context
        
    }
    
    func object(at indexPath: IndexPath) -> Team{
        return fetchedResultsController.object(at: indexPath)
    }
    
// MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchedResultsController.sections?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
        
        return configureCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        let team = fetchedResultsController.object(at: indexPath)
        context.delete(team)
        context.saveChanges()
        
        
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let team = fetchedResultsController.object(at: indexPath)
        
        //cell.textLabel?.text = team.teamName
        
        cell.textLabel?.text = team.teamName
        
        return cell
    }
    

}

//
//  PlayersFetchedResultsController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PlayersFetchedResultsController: NSFetchedResultsController<Players>, NSFetchedResultsControllerDelegate {
    private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, tableView: UITableView) {
        self.tableView = tableView
        
        super.init(fetchRequest: Players.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    
    
    func tryFetch() {
        
    //    let teamPlayers = NSEntityDescription.insertNewObject(forEntityName: "Team", into: managedObjectContext) as! Team
        
        do {
            try performFetch()
            // try fetchedResultsController.performFetch()
            
        } catch {
            print("Unresolved error: \(error.localizedDescription)")
        }
    
    }
    
    
    
    // MARK: - Fetched Results Controller Delegate
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert: guard let newIndexPath = newIndexPath else { return }
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete: guard let indexPath = indexPath else { return }
        tableView.deleteRows(at: [indexPath], with: .automatic)
        case .update, .move: guard let indexPath = indexPath else { return }
        tableView.reloadRows(at: [indexPath], with: .automatic)
            
            
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    
}






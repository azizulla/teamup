import Foundation
import UIKit
import CoreData

class SearchFetchedResultsController: NSFetchedResultsController<Players>, NSFetchedResultsControllerDelegate {
    private let tableView: UITableView
    var context: NSManagedObjectContext!
    var players: [Players] = []
    var invitedPlayers: [Players] = []
   // var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
   
    
    init(managedObjectContext: NSManagedObjectContext, tableView: UITableView) {
        self.tableView = tableView
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Players")
        fetchRequest.predicate = NSPredicate(format: "isInvited.invited == true")

        
        self.delegate = self
        
        tryFetch()
    }
    
    

    func tryFetch() {
        
        //    let teamPlayers = NSEntityDescription.insertNewObject(forEntityName: "Team", into: managedObjectContext) as! Team
     //   var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                let fetchedFriends: [Players]? = results as? [Players]
                if fetchedFriends != nil {
                    self.invitedPlayers = fetchedFriends!
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
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

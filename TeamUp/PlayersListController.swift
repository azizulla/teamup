//
//  TeamListController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData



class PlayersListController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
  //  var delegate: PlayersListControllerDelegate?
    
    
    
    
    lazy var dataSource: TeamDataSource = {
        return TeamDataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = dataSource
        
    }
    
   // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newPlayer" {
            let navigationController = segue.destination as! UINavigationController
            let newPlayerController = navigationController.topViewController as! NewPlayerController
            
            
            newPlayerController.managedObjectContext = self.managedObjectContext
            
        }else if segue.identifier == "showPlayerInfo"{
            guard let detailVC = segue.destination as? PlayerProfileViewController, let indexPath = tableView.indexPathForSelectedRow else{ return }
            
            //let item = dataSource.object(at: indexPath)
            let player = dataSource.object(at: indexPath)
            
            detailVC.player = player
            detailVC.context = self.managedObjectContext
            
 //           detailVC.delegate = self as! PlayerProfileViewControllerDelegate
            
        }    }
}

/*
extension PlayersListController: PlayerProfileViewControllerDelegate{
    func didInvitePlayers(player: Players) {
        var outerIndex: Array.index? = nil
        var innerIndex: Array.index? = nil
        
        
        for (index, player) in sections.enumereted{
            if let indexOfPlayer = player.index(of: contact){
            outerIndex = index
            innerIndex = indexOfPlayer
            
            break
            }
        }
        
        if let outerIndex = outerIndex, let innerIndex = innerIndex{
            var invitedPlayer = sections[outerIndex][innerIndex]
            invitedPlayer.isInvitedPlayer = true
            sections[outerIndex][innerIndex] = invitedPlayer
        
            tableView.reloadData()
            
        }
        
        
    }

}*/




//
//  DetailViewController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var team: Team?
    var context: NSManagedObjectContext!
    
    
    
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamNumberOfPlayersTextField: UITextField!
 
    
    override func viewDidLoad() {
        if let team = team {
            teamNameTextField.text = team.teamName
            teamNumberOfPlayersTextField.text = team.teamNumberOfPlayers
        }
        
    }
    
    
 
    @IBAction func save(_ sender: Any) {
        
        guard let teamName = teamNameTextField.text, !teamName.isEmpty else { print("fill the name field"); return }
        guard let teamPlayers = teamNumberOfPlayersTextField.text, !teamPlayers.isEmpty else { print("fill the name field"); return }
    
       // if let team = team, let teamName = teamNameTextField.text{
        
        
        team?.teamName = teamName
        team?.teamNumberOfPlayers = teamPlayers
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = team {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    
    
}


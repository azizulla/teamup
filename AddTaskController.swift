//
//  AddTaskController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase

class AddTaskController: UIViewController {
    
    var ref:DatabaseReference?
    
    var managedObjectContext: NSManagedObjectContext!
 
    
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamNumberOfPlayersTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AddTaskController context: \(managedObjectContext.description)")
    }

    @IBAction func save(_ sender: Any) {
        
        ref = Database.database().reference()
        
        
        
        guard let teamName = teamNameTextField.text, !teamName.isEmpty else { return }
        guard let teamPlayers = teamNumberOfPlayersTextField.text, !teamPlayers.isEmpty else { return }
        
        
        //let team = NSEntityDescription.insertNewObject(forEntityName: "Team", into: managedObjectContext) as! Team
        
        
       // ref?.child("Team").child(teamName).setValue(teamName)
   //ref?.child("Team").child(teamName).child("Number Of Players").setValue(teamPlayers)

        
        
        let team:[String : AnyObject] = ["name":teamName as AnyObject,
                                         "squad":teamPlayers as AnyObject]
        
         ref?.child("Team").child(teamName).setValue(team)
        
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

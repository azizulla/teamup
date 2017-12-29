//
//  NewPlayerController.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-16.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth

class NewPlayerController: UIViewController {
    
    var ref:DatabaseReference?
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var playerEmailTextField: UITextField!
    @IBOutlet weak var playerFirstNameTextField: UITextField!
    @IBOutlet weak var playerLastNameTextField: UITextField!
    @IBOutlet weak var playerPositionTextField: UITextField!
    @IBOutlet weak var playerJerseyNumberTextField: UITextField!
    
    @IBOutlet weak var playerPassword: UITextField!
    @IBOutlet weak var playerRetypePassword: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    @IBAction func save(_ sender: Any) {
        
    ref = Database.database().reference().root
        
    //let alert = UIAlertController(title: "Ugh...",
      //                                message: " First Name, Last Name, Email, Jersey Number & Position are required.",
        //                              preferredStyle: .alert)
        let alert = UIAlertController(title: "Ugh...",
                                      message: " First Name, Last Name, Email, Jersey Number & Position are required.",
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancelAction)
    
        
    guard let playerEmail = playerEmailTextField.text, !playerEmail.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerFirstName = playerFirstNameTextField.text, !playerFirstName.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerLastName = playerLastNameTextField.text, !playerLastName.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerPosition = playerPositionTextField.text, !playerPosition.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerJerseyNumber = playerJerseyNumberTextField.text, !playerJerseyNumber.isEmpty else { return  present(alert, animated: true, completion: nil)}
    guard let playerPassword = playerPassword.text, !playerPassword.isEmpty else { return present(alert, animated: true, completion: nil)}
  
        
   // guard let currentTeam = team, !currentTeam.isEmpty else { return }
   
    //  let newplayers = NSEntityDescription.insertNewObject(forEntityName: "Players", into: managedObjectContext) as! Players
    
        let player:[String : AnyObject] = ["firstName":playerFirstName as AnyObject,
                                         "lastName":playerLastName as AnyObject,
                                         "email":playerEmail as AnyObject,
                                         "squad":playerJerseyNumber as AnyObject,
                                         "position":playerPosition as AnyObject]
        
    
        
        Auth.auth().createUser(withEmail: playerEmail,
                                   password: playerPassword) { user, error in
        if error == nil {
            Auth.auth().signIn(withEmail: self.playerEmailTextField.text!,password: self.playerPassword.text!)
            
            self.ref?.child("Players").child(playerFirstName).setValue(player)
            
            }
        }
        
        
           dismiss(animated: true, completion: nil)
            
   
        
    }
    
    func alert(_ alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
 
    


    }



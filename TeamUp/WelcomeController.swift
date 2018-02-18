//
//  WelcomeController.swift
//  TeamUp
//
//  Created by Aziz on 2018-02-14.
//  Copyright © 2018 Aziz. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth
import Firebase

class WelcomeController: UIViewController{
    
    var ref:DatabaseReference?
    let storageRef = Storage.storage().reference()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //     profileImage.image = UIImage(named: "867366")
    }
    
    
    // ---  saving the player
    
    @IBAction func playerDetail(_ sender: Any) {
             //   dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "home", sender: self)
        
        
    }
    
}


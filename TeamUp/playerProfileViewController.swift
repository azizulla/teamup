//
//  playerProfileViewController.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-04.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase


class PlayerProfileViewController: UIViewController {
    
    var selectedPost: Players!
    
    var players = [Players]()
    var ref:DatabaseReference?
    var context: NSManagedObjectContext!
    
    
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerEmailLabel: UILabel!
    @IBOutlet weak var playerFirstNameLabel: UILabel!
    @IBOutlet weak var playerLastNameLabel: UILabel!
    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var playerJerseyNumberLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        playerEmailLabel.text = selectedPost.email
        playerFirstNameLabel.text = selectedPost.firstName
        playerLastNameLabel.text = selectedPost.lastName
        playerPositionLabel.text = selectedPost.position
        playerJerseyNumberLabel.text = selectedPost.squad
        
        }
    
    
    
}


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
import FirebaseAuth



class PlayerProfileViewController: UIViewController {
    
    var selectedPost: Players!
    var teamSquad: Team!
    
    var team = [Team]()
    var players = [Players]()
    var ref:DatabaseReference?
    
    
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerEmailLabel: UILabel!
    @IBOutlet weak var playerFirstNameLabel: UILabel!
    @IBOutlet weak var playerLastNameLabel: UILabel!
    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var playerJerseyNumberLabel: UILabel!
    @IBOutlet weak var playerFriendsLabel: UILabel!
    
    @IBOutlet weak var inviteButton: UIButton!
   
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerEmailLabel.text = selectedPost.email
        playerFirstNameLabel.text = selectedPost.firstName
        playerLastNameLabel.text = selectedPost.lastName
        playerPositionLabel.text = selectedPost.position
        playerJerseyNumberLabel.text = selectedPost.squad
        playerFriendsLabel.text = selectedPost.uid
        
        
        self.inviteButton.layer.cornerRadius = 10
        self.inviteButton.clipsToBounds = true
       
        }



    @IBAction func teamInvite(_ sender: Any) {
        

    }
    
    
    
// --- Pass Data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PassPlayerInfo"{
            
            
            guard let detailVC = segue.destination as? ProfileTeamListController  else{ return }
            
            let currenTeam = selectedPost
            
            detailVC.selectedPost = currenTeam!
            //detailVC.selectedPost = players[indexPath.row]
            
            
        }

    }

    
}


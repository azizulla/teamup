//
//  PickUpProfileViewController.swift
//  TeamUp
//
//  Created by Aziz on 2018-02-17.
//  Copyright © 2018 Aziz. All rights reserved.
//


import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth
import Firebase


class PickUpProfileViewController: UIViewController {
    
    var selectedPost: NSDictionary!
    var teamSquad: Team!
    
    var team = [Team]()
    var players = [Players]()
    var ref:DatabaseReference?
    
    
    
   // @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var kitcolor: UILabel!
  //  @IBOutlet weak var jerseyColor: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = selectedPost["name"] as? String
        kitcolor.text = selectedPost["jerseyColor"] as? String
        eventTime.text = selectedPost["eventTime"] as? String
        eventDate.text = selectedPost["eventDate"] as? String
        price.text = selectedPost["price"] as? String
        
        
      //  self.inviteButton.layer.cornerRadius = 10
      //  self.inviteButton.clipsToBounds = true
        
      /*  let currentPlayerUid = selectedPost["uid"] as? String
        
        let imageStorageRef = Storage.storage().reference().child("players").child(currentPlayerUid!).child("profile-400x400.png")
        
        imageStorageRef.getData(maxSize: 2 * 1024 * 1024) { data, error in
            // Error available with .localizedDescription, but can simply be that the image does not exist yet
            if error == nil{
                
                print(data)
                
                self.profileImageView.image = UIImage(data: data!)
                print("success uploading image from firebase")
            } else {
                
                print(error?.localizedDescription ?? "testing")
            }
            
        }*/
        
    }
    
    
    @IBAction func teamInvite(_ sender: Any) {
        
    }
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    // --- Pass Data
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PassPlayerInfo"{
            
            
            guard let detailVC = segue.destination as? ProfileTeamListController  else{ return }
            
            let currenTeam = selectedPost
            
            detailVC.selectedPost = currenTeam!
            //detailVC.selectedPost = players[indexPath.row]
            
            
        }
        
    }
    */
    
}


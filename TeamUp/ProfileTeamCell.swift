//
//  ProfileTeamCell.swift
//  TeamUp
//
//  Created by Aziz on 2018-01-28.
//  Copyright © 2018 Aziz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfileTeamCell: UITableViewCell {
    
    var ref:DatabaseReference?
    
    @IBOutlet weak var profileTeamList: UILabel!
   // @IBOutlet weak var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        //self.profileImage.layer.cornerRadius = 10
        //self.profileImage.clipsToBounds = true
    }
    
    
    
    @IBAction func playerInvitation(_ sender: Any) {
        
    }
}


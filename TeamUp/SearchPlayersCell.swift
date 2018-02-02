//
//  SearchPlayersCell.swift
//  TeamUp
//
//  Created by Aziz on 2017-11-29.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SearchPlayersCell: UITableViewCell {
    
    var ref:DatabaseReference?
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
         self.layer.cornerRadius = self.frame.height / 2
         self.clipsToBounds = true
         
         profileImage.layer.cornerRadius = 10
         */
        self.profileImage.layer.cornerRadius = 10
        self.profileImage.clipsToBounds = true
    }
    
    
    
    @IBAction func playerInvitation(_ sender: Any) {
        
    }
}

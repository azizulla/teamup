//
//  RequestViewController.swift
//  
//
//  Created by Aziz on 2017-12-28.
//
//

import UIKit

class RequestViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
     var players = [Players]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FriendSystem.system.requestList)
        
        FriendSystem.system.addRequestObserver {
            print(FriendSystem.system.requestList)
            self.tableView.reloadData()
        }
    }
    
}

extension RequestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendSystem.system.requestList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell") as? PlayersCell
        if cell == nil {
            tableView.register(UINib(nibName: "PlayersCell", bundle: nil), forCellReuseIdentifier: "PlayersCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell") as? PlayersCell
        }
        
        // Modify cell
      //  cell!.playerInvitation.setTitle("Accept", for: UIControlState())
        
        
        cell!.friendNameLabel.text = players[indexPath.row].firstName
     
     //   cell!.setFunction {
       //     let id = self.players[indexPath.row].id
       //     FriendSystem.system.acceptFriendRequest(id!)
        //}
        
        // Return cell
        return cell!
    }
    
}

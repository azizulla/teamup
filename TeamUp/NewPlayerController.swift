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
import Firebase

class NewPlayerController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref:DatabaseReference?
    let storageRef = Storage.storage().reference()
    var imageUploadManager: ImageUploadManager?
    
   // var storageRef = Storage().reference()
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var playerEmailTextField: UITextField! 
    @IBOutlet weak var playerFirstNameTextField: UITextField!
    @IBOutlet weak var playerLastNameTextField: UITextField!
    @IBOutlet weak var playerPositionTextField: UITextField!
    @IBOutlet weak var playerJerseyNumberTextField: UITextField!
    
    @IBOutlet weak var playerPassword: UITextField!
    @IBOutlet weak var playerRetypePassword: UITextField!

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var imageUploadProgressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Database.database().reference()
        profileImage.image = UIImage(named: "867366")
    }

    @IBAction func uploadImageButton(_ sender: Any) {
    
        let imagePickerButton = UIImagePickerController()
        imagePickerButton.allowsEditing = false
        imagePickerButton.sourceType = .photoLibrary
        imagePickerButton.delegate = self
        
        present(imagePickerButton, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let user = Auth.auth().currentUser?.uid
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        profileImage.image = image
        profileImage.contentMode = .scaleAspectFill
    
         let imageData = UIImagePNGRepresentation(self.profileImage.image!)
        
        let storageRef = Storage.storage().reference().child("players/\(user)/profile-400x400.png")
        let metadata = StorageMetadata(dictionary: ["contentType": "image/png"])
       
        
        let uploadTask = storageRef.putData(imageData!, metadata: metadata) { (metadata, error) in
            guard metadata != nil else {
                print("Error uploading image to Firebase Storage: \(error?.localizedDescription)")
                return
            }
            
            //let storageRef = Storage.storage().reference().child("shared/profile-80x80.png")
            //storageRef.putData(imageData!, metadata: StorageMetadata(dictionary: ["contentType": "image/png"]))
            
            print("Uploda complete! \(metadata?.downloadURL())")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
   
    
// ---  saving the player
    
    @IBAction func save(_ sender: Any) {
     
    let userID = Auth.auth().currentUser?.uid
        
    ref = Database.database().reference().root
        
        let alert = UIAlertController(title: "Ugh...",
                                      message: " First Name, Last Name, Email, Jersey Number & Position are required.",
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancelAction)
    
   // let profileImage = self.profileImage
        
        
    guard let playerEmail = playerEmailTextField.text, !playerEmail.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerFirstName = playerFirstNameTextField.text, !playerFirstName.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerLastName = playerLastNameTextField.text, !playerLastName.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerPosition = playerPositionTextField.text, !playerPosition.isEmpty else { return present(alert, animated: true, completion: nil)}
    guard let playerJerseyNumber = playerJerseyNumberTextField.text, !playerJerseyNumber.isEmpty else { return  present(alert, animated: true, completion: nil)}
    guard let playerPassword = playerPassword.text, !playerPassword.isEmpty else { return present(alert, animated: true, completion: nil)}

        
        
        
        // Create the user with the provided credentials
        Auth.auth().createUser(withEmail: playerEmail, password: playerPassword, completion: { (user, error) in
            
            guard let user = user, error == nil else {
              //  self.showMessagePrompt(error!.localizedDescription)
                return
            }

            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = playerFirstName
            let userID = user.uid
            
            let player:[String : AnyObject] = ["firstName":playerFirstName as AnyObject,
                                               "lastName":playerLastName as AnyObject,
                                               "email":playerEmail as AnyObject,
                                               "squad":playerJerseyNumber as AnyObject,
                                               "position":playerPosition as AnyObject,
                                               "uid":userID as AnyObject]

            // Commit profile changes to server
            changeRequest?.commitChanges() { (error) in
                
                
                // [START basic_write]
                self.ref?.child("Players").child(user.uid).setValue(player)
                // [END basic_write]
                Auth.auth().signIn(withEmail: self.playerEmailTextField.text!,password: self.playerPassword.text!)
                //   self.performSegue(withIdentifier: "signIn", sender: nil)
            }

            
    
            
        })
        
        
      /*  Auth.auth().createUser(withEmail: playerEmail,
                                   password: playerPassword) { user, error in
        if error == nil {
            Auth.auth().signIn(withEmail: self.playerEmailTextField.text!,password: self.playerPassword.text!)
            
            self.ref?.child("Players").childByAutoId().setValue(player)
           // self.ref?.child("Players").child(userID!).setValue(player)
            
            }
        }*/
        
        
           dismiss(animated: true, completion: nil)
            
   
        
    }
    
    func alert(_ alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
   

    
 
    


    }



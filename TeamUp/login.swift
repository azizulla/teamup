//
//  login.swift
//  TeamUp
//
//  Created by Aziz on 2017-12-22.
//  Copyright © 2017 Aziz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Constants
    let loginToList = "LoginToList"
     weak var currentUser: User?
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.loginToList, sender: nil)
                print(user)
            }
        }*/
        
      
            
            /* Add a state change listener to firebase
             to get a notification if the user signed in.
             */
            Auth.auth().addStateDidChangeListener({ (auth, user) in
                if user != nil && user != self.currentUser {
                    self.currentUser = user
                    self.performSegue(withIdentifier: self.loginToList,
                                      sender: self)
                    print(" user already loged in")
                }
            })


        

    }
    
    // MARK: Actions
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Error",
                                      message: " Please enter an email and password.",
                                      preferredStyle: .alert)
        
       
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)

       alert.addAction(cancelAction)
        guard let userName = textFieldLoginEmail.text, !userName.isEmpty else { return  present(alert, animated: true, completion: nil)}
        guard let userPassword = textFieldLoginPassword.text, !userPassword.isEmpty else { return present(alert, animated: true, completion: nil)
 }
        
       Auth.auth().signIn(withEmail: userName, password:userPassword)

 }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
    
}


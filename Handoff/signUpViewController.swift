//
//  signUpViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class signUpViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let ref = Database.database().reference().child("users")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        let userList = ["name": "\(username.text!)", "email": "\(email.text!)", "password": "\(password.text!)"]
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (result, error) in
            print(Auth.auth().currentUser?.uid ?? "")
            self.ref.child(Auth.auth().currentUser?.uid ?? "").setValue(userList)
            
            if error == nil{
                self.performSegue(withIdentifier: "signUpSuccess", sender: nil)
            }
            else{
                print("Error in Signing Up")
            }
        }
        
        
        
    }
    
}

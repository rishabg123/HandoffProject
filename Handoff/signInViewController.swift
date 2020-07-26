//
//  signInViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth


class signInViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
                self.performSegue(withIdentifier: "signInSuccess", sender: nil)
            }
        }
        
    }
    

    @IBAction func signInClicked(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (result, error) in
            if error == nil{
                self.performSegue(withIdentifier: "signInSuccess", sender: nil)
            }
            else{
                print("Error")
            }
        }
    }
}

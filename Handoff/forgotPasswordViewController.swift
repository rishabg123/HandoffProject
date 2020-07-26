//
//  forgotPasswordViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth
class forgotPasswordViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendEmailClicked(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: email.text!) { (error) in
            if error != nil{
                print("success")
            }
            else{
                print(error)
            }
        }
        
    }
    
}

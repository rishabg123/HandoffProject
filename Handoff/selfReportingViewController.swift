//
//  selfReportingViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class selfReportingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var hours:Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference().child("group1/Rishab/miles")
        ref.observe(.value) { (snapshot) in
            self.hours = (snapshot.value as! NSString).doubleValue
        }
       
        
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        let ref = Database.database().reference().child("group1/Rishab/miles")
        if textField.text == nil{
            print("text field is empty")
            return
        }
        self.hours = self.hours! + (textField.text as NSString?)!.doubleValue
        ref.setValue("\(hours ?? 1.0)")
    }
    

}

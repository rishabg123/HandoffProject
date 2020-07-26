//
//  ViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    var progress1:Float?
    var progress2:Float?
    var progress3:Float?
    var percentComplete:Double?
   
    
    let shapeLayer = CAShapeLayer()

    @IBOutlet weak var ProgressView1: UIProgressView!
    
    @IBOutlet weak var ProgressView2: UIProgressView!
    
    @IBOutlet weak var ProgressView3: UIProgressView!
    
    @IBOutlet weak var button: UIButton!
  
    let ref = Database.database().reference().child("group1/hasBaton")
    let ref1 = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        ref1.child("group1/Rishab/miles").observe(.value) { (snapshot) in
            self.label1.text = (snapshot.value as? String)! + " mi"
            self.progress1 = (snapshot.value as? NSString)?.floatValue
            self.ProgressView1.progress = self.progress1! / 10
            
            
        }
        
        ref1.child("group1/Tyler/miles").observe(.value) { (snapshot) in
                   self.label2.text = (snapshot.value as? String)! + " mi"
            self.progress2 = (snapshot.value as? NSString)?.floatValue
            self.ProgressView2.progress = self.progress2! / 10



               }
        ref1.child("group1/Thomas/miles").observe(.value) { (snapshot) in
            self.label3.text = (snapshot.value as? String)! + " mi"
            self.progress3 = (snapshot.value as? NSString)?.floatValue
            self.ProgressView3.progress = self.progress3! / 10

            
            
               }
        
        let total1 = (label1.text as NSString?)!.doubleValue
        let total2 = (label2.text as NSString?)!.doubleValue
        let total3 = (label3.text as NSString?)!.doubleValue
        
        print(total1 + total2 + total3)
        

        

        ProgressView1.transform = ProgressView1.transform.scaledBy(x: 1, y: 8)
        ProgressView2.transform = ProgressView2.transform.scaledBy(x: 1, y: 8)
        ProgressView3.transform = ProgressView3.transform.scaledBy(x: 1, y: 8)
        
        
        ProgressView1.layer.cornerRadius = 10
        ProgressView1.clipsToBounds = true
        ProgressView1.layer.sublayers![1].cornerRadius = 10
        ProgressView1.subviews[1].clipsToBounds = true
        
        
               ProgressView2.layer.cornerRadius = 10
               ProgressView2.clipsToBounds = true
               ProgressView2.layer.sublayers![1].cornerRadius = 10
               ProgressView2.subviews[1].clipsToBounds = true
        
       
        ProgressView3.layer.cornerRadius = 10
        ProgressView3.clipsToBounds = true
        ProgressView3.layer.sublayers![1].cornerRadius = 10
        ProgressView3.subviews[1].clipsToBounds = true
        
        ProgressView1.tintColor = .orange
        ProgressView2.tintColor = .orange
        ProgressView3.tintColor = .orange
        percentComplete = 0.6
        
               ref.observe(.value) { (snapshot) in
                   if snapshot.value as? String == "false"{
                       self.button.isEnabled = true
                   }
                   else{
                       self.button.isEnabled = false
                   }
                
                let center = self.view.center
                


                       let trackLayer = CAShapeLayer()
                let circularPath = UIBezierPath(arcCenter: CGPoint(x: 210, y: 280), radius: 150, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi,clockwise: true)
                       trackLayer.path = circularPath.cgPath

                       trackLayer.strokeColor = UIColor.lightGray.cgColor
                       trackLayer.lineWidth = 30
                       trackLayer.fillColor = UIColor.clear.cgColor
                trackLayer.lineCap = CAShapeLayerLineCap.round
                self.view.layer.addSublayer(trackLayer)



                       //let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2CGFloat.pi,clockwise: true)
                self.shapeLayer.path = circularPath.cgPath

                self.shapeLayer.strokeColor = UIColor.orange.cgColor
                self.shapeLayer.lineWidth = 30
                self.shapeLayer.fillColor = UIColor.clear.cgColor
                self.shapeLayer.lineCap = CAShapeLayerLineCap.round
                self.shapeLayer.strokeEnd = 0

                self.view.layer.addSublayer(self.shapeLayer)

                       //statusBar() animates the progress bar
                self.statusBar()
                
                   
               }
    }

    @IBAction func getBatonClicked(_ sender: Any) {
        ref.setValue("true")
        
    }
    func statusBar(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")

        basicAnimation.toValue = self.percentComplete! - 0.1

        basicAnimation.duration = 2

        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey:"urSoBasic")

    }
}


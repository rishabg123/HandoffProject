//
//  selfReportingViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase


class selfReportingViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var textField: UITextField!
    var hours:Double?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        locationManager.requestWhenInUseAuthorization()
              if CLLocationManager.locationServicesEnabled() {
                  locationManager.delegate = self
                  locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                  locationManager.startUpdatingLocation()
              }
        
        self.locationManager.requestWhenInUseAuthorization()
                 if CLLocationManager.locationServicesEnabled() {
                     locationManager.delegate = self
                     locationManager.desiredAccuracy = kCLLocationAccuracyBest
                 }
           var currentLoc = locationManager.location
           print(currentLoc!.coordinate.latitude)
           print(currentLoc!.coordinate.longitude)
           let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
           let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentLoc!.coordinate.latitude, longitude: currentLoc!.coordinate.longitude), span: span)
               map.setRegion(region, animated: true)
           self.map.showsUserLocation = true
        
        
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
        self.performSegue(withIdentifier: "toDashboard", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

}

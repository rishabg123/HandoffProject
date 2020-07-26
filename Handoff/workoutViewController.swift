//
//  workoutViewController.swift
//  Handoff
//
//  Created by Rishab Gupta on 7/25/20.
//  Copyright © 2020 Rishab Gupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase

class workoutViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    

    //create four outlets under here:
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    

    var hours = 0
    var minutes = 0
    var seconds = 0
    var lat = 0.0
    var long = 0.0
    
    var timer = Timer()
    
    
    
    
    
    
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    }
    override func viewWillAppear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
    }
   
  
    @IBAction func start(_ sender: Any) {
        stopButton.isEnabled = true
               startButton.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(count), userInfo: nil, repeats: true)

    }
    @objc func count(){
           seconds += 1
           if seconds == 60{
               minutes += 1
               seconds = 0
           }
           if minutes == 60{
               minutes = 0
               seconds = 0
               hours += 1
           }
           if hours == 24{
               timer.invalidate()
           }

           secondLabel.text = seconds < 10 ? "0\(seconds)" : "\(seconds)"
           minuteLabel.text = minutes < 10 ? "0\(minutes)" : "\(minutes)"
           hourLabel.text = hours < 10 ? "0\(hours)" : "\(hours)"
       }
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        let ref = Database.database().reference().child("group1/hasBaton")
        ref.setValue("false")
        
    }

}

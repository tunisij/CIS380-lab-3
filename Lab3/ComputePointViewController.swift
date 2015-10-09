// John Tunisi and Douglas Money
//
//  ComputePointViewController.swift
//  Lab3
//
//  Created by John Tunisi on 9/23/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit
import CoreLocation

class ComputePointViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var startLatitudeNumericTextField: UITextField!
    @IBOutlet weak var startLongitudeNumericTextField: UITextField!
    @IBOutlet weak var distanceNumericTextField: UITextField!
    @IBOutlet weak var bearingNumericTextField: UITextField!
    @IBOutlet weak var endpointLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateButton(sender: UIButton) {
        let latitude = NSString(string: startLatitudeNumericTextField.text!).doubleValue
        let longitude = NSString(string: startLongitudeNumericTextField.text!).doubleValue
        let myLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        let bearing = NSString(string: bearingNumericTextField.text!).doubleValue
        let distance = NSString(string: distanceNumericTextField.text!).doubleValue
        let endpoint = myLocation.findingPoint(bearing, atDistance: distance)
        
        endpointLabel.text = "Endpoint: (\(Double(round(100000*endpoint.coordinate.latitude)/100000)), \(Double(round(100000*endpoint.coordinate.longitude)/100000)))"
        view.endEditing(true)
    }
    
    @IBAction func clearButton(sender: UIButton) {
        startLatitudeNumericTextField.text = nil
        startLongitudeNumericTextField.text = nil
        distanceNumericTextField.text = nil
        bearingNumericTextField.text = nil
        endpointLabel.text = "Endpoint:"
        view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
}
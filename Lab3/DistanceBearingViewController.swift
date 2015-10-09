// John Tunisi and Douglas Money
//
//  DistanceBearingViewController.swift
//  Lab3
//
//  Created by John Tunisi on 9/23/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit
import CoreLocation

class DistanceBearingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var latitude1NumericTextField: UITextField!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bearingLabel: UILabel!
    @IBOutlet weak var longitude2NumericTextField: UITextField!
    @IBOutlet weak var latitude2NumericTextField: UITextField!
    @IBOutlet weak var longitude1NumericTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearButton(sender: UIButton) {
        latitude1NumericTextField.text = nil
        latitude2NumericTextField.text = nil
        longitude1NumericTextField.text = nil
        longitude2NumericTextField.text = nil
        distanceLabel.text = "Distance:"
        bearingLabel.text = "Bearing:"
        view.endEditing(true)
    }
    
    @IBAction func calculateButton(sender: UIButton) {
        let latitude1 = NSString(string: latitude1NumericTextField.text!).doubleValue
        let latitude2 = NSString(string: latitude2NumericTextField.text!).doubleValue
        let longitude1 = NSString(string: longitude1NumericTextField.text!).doubleValue
        let longitude2 = NSString(string: longitude2NumericTextField.text!).doubleValue
        
        let point1 = CLLocation(latitude: latitude1, longitude: longitude1)
        let point2 = CLLocation(latitude: latitude2, longitude: longitude2)
        
        let distance = point1.distanceFromLocation(point2)
        let bearing = point1.bearingToPoint(point2)
        
        distanceLabel.text = "Distance: \(Double(round(distance/10)/100)) kilometers"
        bearingLabel.text = "Bearing: \(Double(round(100*bearing)/100)) degrees"

        view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

}


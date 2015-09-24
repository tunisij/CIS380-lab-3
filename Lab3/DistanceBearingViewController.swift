// John Tunisi and Douglas Money
//
//  ViewController.swift
//  Lab3
//
//  Created by John Tunisi on 9/23/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit

class DistanceBearingViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }

}


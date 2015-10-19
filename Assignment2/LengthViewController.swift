//
//  LengthViewController.swift
//  Assignment2
//
//  Created by Priyanka Zaveri on 10/19/15.
//  Copyright (c) 2015 Priyanka Zaveri. All rights reserved.
//

import UIKit


class LengthViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var lengthSegment: UISegmentedControl!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var kilometersLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    // Segment control changed
    
    @IBAction func lengthSegmentChanged(sender: AnyObject) {
        switch lengthSegment.selectedSegmentIndex
        {
        case 0:
            milesLabel.text = "Distance in Miles"
            kilometersLabel.text = "Distance in Kilometers"
        case 1:
            milesLabel.text = "Distance in Kilometers"
            kilometersLabel.text = "Distance in Miles"
        default:
            milesLabel.text = "Distance in Miles"
            kilometersLabel.text = "Distance in Kilometers"
            
        }
    }
    
    // Convert button
    
    @IBAction func convertButton(sender: AnyObject) {
        if var distance = inputField.text.toDouble() {
            var numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            
            if lengthSegment.selectedSegmentIndex == 0 {
                distance = distance * 1.60934
                
            } else if lengthSegment.selectedSegmentIndex == 1 {
                distance = distance * 0.621371
            }
            
            outputLabel.text = numberFormatter.stringFromNumber(distance)
        } else {
            let alert = UIAlertView(title: "Error", message: "Please enter a number", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    // Clear Button
    
    @IBAction func clearButton(sender: AnyObject) {
        inputField.text = ""
        outputLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
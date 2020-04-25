//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var billTotal = 0.0
    var numberOfPeople = 2
    var finalResult = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Dismisses keyboard when percentage buttons are pushed
        billTextField.endEditing(true)
        
        // set all buttons as not selected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // sets the selected button to show keeping the others off
        sender.isSelected = true
        
        // sets the variable for the button pressed
        let buttonTitle = sender.currentTitle!
        
        // sets the button without percentage mark
        let buttonNumberWithoutPctSymbol = buttonTitle.dropLast()
        
        // converts button title into a double
        let buttonTitleAsNumber = Double(buttonNumberWithoutPctSymbol)!
        
        // declare and initate the tip variable
        tip = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        // tests to make sure there is data in the Fieldtext
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
            
        }
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBillPerPerson = finalResult
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipPct = tip
        }
    }
}


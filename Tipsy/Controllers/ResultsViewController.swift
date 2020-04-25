//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Taylor Patterson on 4/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBillPerPerson: String?
    var numberOfPeople: Int?
    var tipPct: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = String(numberOfPeople!)
        let tip = String(format: "%.0f", tipPct! * 100)
        
        
        totalLabel.text = totalBillPerPerson
        settingsLabel.text = "Split between \(number) people, with \(tip)% tip."
    }
    
    @IBAction func reclculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

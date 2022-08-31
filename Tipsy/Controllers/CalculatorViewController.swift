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
    
    var tip_percentage: Float = 0.1
    var total_price: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Showing which tip amount selected
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        // Printing amount as decimal
        var amount_str: String = String(sender.titleLabel?.text ?? "0")
        if let i = amount_str.firstIndex(of: "%") {
            amount_str.remove(at: i)
        }
        tip_percentage = (Float(amount_str) ?? 0) / 100.0
        
        //Getting rid of text field
        billTextField.endEditing(true)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // Incrementing or Decreasing
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let numPeople = Float(splitNumberLabel.text ?? "2.0") ?? 2.0
        let total: Float = Float(billTextField.text ?? "0.0") ?? 0.0
        
        // Per person
        let price = (total + total*tip_percentage) / numPeople
        let printed_price = round(price*100) / 100.0
        total_price = printed_price
        
        // Segue to results page
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            let passed_price = String(total_price)
            let passed_num_people = splitNumberLabel.text
            let passed_tip_pct = String(tip_percentage*100) + "%"
            
            destinationVC.total_price = passed_price
            destinationVC.num_people = passed_num_people
            destinationVC.tip_percentage = passed_tip_pct
        }
    }
}


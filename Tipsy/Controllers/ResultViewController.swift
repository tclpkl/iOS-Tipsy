//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Timothy Lin on 6/2/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total_price: String?
    var num_people: String?
    var tip_percentage: String?
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total_price
        settingsLabel.text = "Split between \(num_people!) people with a \(tip_percentage!) tip."
    }
}

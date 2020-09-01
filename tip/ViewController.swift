//
//  ViewController.swift
//  tip
//
//  Created by Jacquelyn Chow on 8/22/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfPerson: UISegmentedControl!
    
    @IBAction func resetButton(_ sender: Any) {
        billAmountText.text = ""
        tipPercentageLabel.text = "0"
        tipPercentageSlider.value = 0
        tipTotalLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    var numberOnScreen:Double = 0;
    @IBOutlet weak var billAmountText: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        billAmountText.text = billAmountText.text! + String(sender.tag-1)
        numberOnScreen = Double(billAmountText.text!)!
    }
    @IBAction func deleteNumber(_ sender: UIButton) {
        billAmountText.text = String(String(billAmountText.text!).dropLast())
    }
    @IBAction func addDecimal(_ sender: UIButton) {
        billAmountText.text = billAmountText.text! + "."
    }
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
        self.title = "Tiptastic"

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults and use it to update the tip amount
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        // get current tip percent
        let currentTipPercent = Double(sender.value)
        // set tip percent label value
        tipPercentageLabel.text = String(format: "%.2f", currentTipPercent)
    }
    @IBAction func calculateTip(_ sender: Any) {
        // get initial bill amount and calculate tips
        let bill = Double(billAmountText.text!) ?? 0
        let tipPercent = Double(tipPercentageLabel.text!) ?? 0
        let splitPersons = [1,2,3]
        let splitVal = Double(splitPersons[numberOfPerson.selectedSegmentIndex])
        
        // calculate tip and total
        let tip = bill * (tipPercent/100)
        let total = (bill + tip)/splitVal
        // update the tip and total labels
        tipTotalLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}


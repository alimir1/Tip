//
//  TipViewController.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var billAmountView: UIView!
    @IBOutlet weak var billDetailView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var totAmountPerPersonLabel: UILabel!
    
    private var originalBillAmountViewCenterY = CGFloat()
    private var originalBillDetailViewCenterY = CGFloat()
    
    private var tipPercentage = 20
    private var billAmount = 0.00
    private var tipAmount = 0.00
    private var totalAmount = 0.00
    private var numberOfPeople = 4
    private var totAmountPerPerson = 0.00
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDisplay()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        originalBillAmountViewCenterY = billAmountView.center.y
        originalBillDetailViewCenterY = billDetailView.center.y
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func amountChanged(_ sender: Any) {
        billAmount = Double(billAmountTextField.text ?? "") ?? 0.0
        updateDisplay()
    }
    
    @IBAction func increaseTipPercentage(_ sender: UIButton) {
        if tipPercentage + 1 <= 100 {
            tipPercentage += 1
            calculateTip()
            updateLabels()
        }
    }
    
    @IBAction func decreaseTipPercentage(_ sender: UIButton) {
        if tipPercentage - 1 >= 0 {
            tipPercentage -= 1
            calculateTip()
            updateLabels()
        }
    }
    
    @IBAction func increaseNumPeople(_ sender: UIButton) {
        numberOfPeople += 1
        calculateTip()
        updateLabels()
    }
    
    @IBAction func decreaseNumPeople(_ sender: UIButton) {
        if numberOfPeople - 1 > 0 {
            numberOfPeople -= 1
            calculateTip()
            updateLabels()
        }
    }
    
    private func updateDisplay() {
        updateViewLayouts(isBillAmountEmpty: isBillAmountEmpty())
        calculateTip()
        updateLabels()
    }
    
    private func updateViewLayouts(isBillAmountEmpty: Bool) {
        if (isBillAmountEmpty) {
            UIView.animate(withDuration: 0.4) {
                self.billDetailView.alpha = 0
                self.billAmountView.center.y = self.view.center.y
                self.billDetailView.center.y = self.billAmountView.center.y * 2
            }
        } else {
            UIView.animate(withDuration: 0.4) {
                self.billDetailView.alpha = 1
                self.billAmountView.center.y = self.originalBillAmountViewCenterY
                self.billDetailView.center.y = self.originalBillDetailViewCenterY
            }
        }
    }
    
    private func calculateTip() {
        tipAmount = Double(tipPercentage)/100 * billAmount
        totalAmount = tipAmount + billAmount
        totAmountPerPerson = totalAmount/Double(numberOfPeople)
    }
    
    private func updateLabels() {
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        tipPercentageLabel.text = "\(tipPercentage)%"
        numOfPeopleLabel.text = "\(numberOfPeople)"
        totAmountPerPersonLabel.text = String(format: "$%.2f", totAmountPerPerson)
    }
    
    @objc private func dismissKeyboard() {
        if (!isBillAmountEmpty()) {
            self.view.endEditing(true)
        }
    }
    
    private func isBillAmountEmpty() -> Bool {
        return billAmountTextField.text == ""
    }
}

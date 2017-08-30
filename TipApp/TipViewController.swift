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
    
    var tip = Tip()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tip.tipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
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
        tip.billAmount = Double(billAmountTextField.text ?? "") ?? 0.0
        updateDisplay()
    }
    
    @IBAction func increaseTipPercentage(_ sender: UIButton) {
        if tip.tipPercentage + 1 <= 100 {
            tip.tipPercentage += 1
            updateLabels()
        }
    }
    
    @IBAction func decreaseTipPercentage(_ sender: UIButton) {
        if tip.tipPercentage - 1 > 0 {
            tip.tipPercentage -= 1
            updateLabels()
        }
    }
    
    @IBAction func increaseNumPeople(_ sender: UIButton) {
        tip.numPeopleSharing += 1
        updateLabels()
    }
    
    @IBAction func decreaseNumPeople(_ sender: UIButton) {
        if tip.numPeopleSharing - 1 > 0 {
            tip.numPeopleSharing -= 1
            updateLabels()
        }
    }
    
    private func updateDisplay() {
        updateViewLayouts(isBillAmountEmpty: isBillAmountEmpty())
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
    
    private func updateLabels() {
        totalAmountLabel.text = String(format: "$%.2f", tip.totalAmount)
        tipAmountLabel.text = String(format: "$%.2f", tip.tipAmount)
        tipPercentageLabel.text = "\(tip.tipPercentage)%"
        numOfPeopleLabel.text = "\(tip.numPeopleSharing)"
        totAmountPerPersonLabel.text = String(format: "$%.2f", tip.totalAmountPerPerson)
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

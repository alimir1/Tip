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
    @IBOutlet weak var terribleOptionButton: UIButton!
    @IBOutlet weak var satisfactoryOptionButton: UIButton!
    @IBOutlet weak var excellentOptionButton: UIButton!
    
    private var originalBillAmountViewCenterY = CGFloat()
    private var originalBillDetailViewCenterY = CGFloat()
    
    var tip = Tip(defaultExperience: .satisfactory)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        billAmountTextField.becomeFirstResponder()
        satisfactoryOptionButton.isSelected = true
        setExperienceButtonImages()
        setOriginalCenterValues()
        setupNavigationController()
    }
    
    @IBAction func highlightExperience(_ sender: UIButton) {
        updateSelectedButtonUI(sender)
        switch sender.tag {
        case 0:
            tip.selectedTipType = .terrible
            tip.resetTipPercentage()
        case 1:
            tip.selectedTipType = .satisfactory
            tip.resetTipPercentage()
        case 2:
            tip.selectedTipType = .excellent
            tip.resetTipPercentage()
        default:
            break
        }
        updateLabels()
    }
    
    @IBAction func amountChanged(_ sender: UITextField) {
        sender.text = sender.text?.currencyInputFormatting()
        tip.billAmount = (sender.text ?? "").decimalValueFromCurrency()
        updateDisplay()
    }
    
    @IBAction func increaseTipPercentage(_ sender: UIButton) {
        if tip.currentTipPercentage + 1 <= 100 {
            tip.currentTipPercentage += 1
            updateLabels()
        }
    }
    
    @IBAction func decreaseTipPercentage(_ sender: UIButton) {
        if tip.currentTipPercentage - 1 > 0 {
            tip.currentTipPercentage -= 1
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
        tipPercentageLabel.text = "\(tip.currentTipPercentage)%"
        numOfPeopleLabel.text = "\(tip.numPeopleSharing)"
        totAmountPerPersonLabel.text = String(format: "$%.2f", tip.totalAmountPerPerson)
    }
    
    @objc private func dismissKeyboard() {
        if (!isBillAmountEmpty()) {
            self.view.endEditing(true)
        }
    }
    
    private func setExperienceButtonImages() {
        satisfactoryOptionButton.setImage(#imageLiteral(resourceName: "FilledHappy"), for: .selected)
        satisfactoryOptionButton.setImage(#imageLiteral(resourceName: "UnfilledHappy"), for: .normal)
        excellentOptionButton.setImage(#imageLiteral(resourceName: "FilledExcited"), for: .selected)
        excellentOptionButton.setImage(#imageLiteral(resourceName: "UnfilledExcited"), for: .normal)
        terribleOptionButton.setImage(#imageLiteral(resourceName: "FilledSad"), for: .selected)
        terribleOptionButton.setImage(#imageLiteral(resourceName: "UnfilledSad"), for: .normal)
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setOriginalCenterValues() {
        originalBillAmountViewCenterY = billAmountView.center.y
        originalBillDetailViewCenterY = billDetailView.center.y
    }
    
    private func updateSelectedButtonUI(_ button: UIButton) {
        if !button.isSelected {
            button.isSelected = true
        }
        if button == terribleOptionButton {
            satisfactoryOptionButton.isSelected = false
            excellentOptionButton.isSelected = false
        } else if button == satisfactoryOptionButton {
            terribleOptionButton.isSelected = false
            excellentOptionButton.isSelected = false
        } else if button == excellentOptionButton {
            satisfactoryOptionButton.isSelected = false
            terribleOptionButton.isSelected = false
        } else {
            return
        }
    }
    
    private func isBillAmountEmpty() -> Bool {
        return billAmountTextField.text == "" || (billAmountTextField.text ?? "").decimalValueFromCurrency() == 0.0
    }
}

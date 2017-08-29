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
    
    var originalBillAmountViewCenterY = CGFloat()
    var originalBillDetailViewCenterY = CGFloat()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutViews(isBillAmountEmpty: isBillAmountEmpty())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        originalBillAmountViewCenterY = billAmountView.center.y
        originalBillDetailViewCenterY = billDetailView.center.y
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func amountChanged(_ sender: Any) {
        layoutViews(isBillAmountEmpty: isBillAmountEmpty())
    }
    
    func layoutViews(isBillAmountEmpty: Bool) {
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
    
    func dismissKeyboard() {
        if (!isBillAmountEmpty()) {
            self.view.endEditing(true)
        }
    }
    
    func isBillAmountEmpty() -> Bool {
        return billAmountTextField.text == ""
    }
}

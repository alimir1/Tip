//
//  ViewController.swift
//  TipApp
//
//  Created by Ali Mir on 8/6/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit

class DisplayVC: UIViewController {

    var tapGestureRecognizer = UITapGestureRecognizer()
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var billSegmentedControl: UISegmentedControl!
    
    let percentages: [Percentages] = [.low, .medium, .high]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        billSegmentedControl.addTarget(self, action: #selector(updateTipCalc), for: .valueChanged)
        billTextField.addTarget(self, action: #selector(updateTipCalc), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDefaults()
    }
    
    func loadDefaults() {
        let defaultPercentage = UserDefaults.standard.object(forKey: "SELECTED_PERCENTAGE") as? Double ?? 0
        let theme = UserDefaults.standard.object(forKey: "SELECTED_THEME") as? String ?? ""
        
        if let percentage = Percentages(rawValue: defaultPercentage) {
            billSegmentedControl.selectedSegmentIndex = percentages.index(of: percentage) ?? 0
        }
        
        if let theme = Themes(rawValue: theme) {
            setupThemes(theme: theme)
        }
    }
    
    func setupThemes(theme: Themes) {
        switch theme {
        case .dark:
            view.backgroundColor = .black
        case .light:
            view.backgroundColor = .white
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func navToSettingsVC(_ sender: UIBarButtonItem?) {
        self.navigationController?.pushViewController(SettingsVC(), animated: true)
    }
    
    func updateTipCalc() {
        let selectedTipIndex = billSegmentedControl.selectedSegmentIndex
        let billAmnt = Double(billTextField.text ?? "0") ?? 0
        let tipAmnt = billAmnt*percentages[selectedTipIndex].rawValue
        let totalAmnt = billAmnt + tipAmnt
        
        tipLabel.text = String(format: "$%.2f", tipAmnt)
        totalLabel.text = String(format: "$%.2f", totalAmnt)
    }

}


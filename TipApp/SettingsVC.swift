//
//  SettingsVC.swift
//  TipApp
//
//  Created by Ali Mir on 8/6/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Eureka

class SettingsVC: FormViewController {
    
    var selectedPercentage = UserDefaults.standard.object(forKey: "SELECTED_PERCENTAGE") as? Double ?? Percentages.low.rawValue  {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(selectedPercentage, forKey: "SELECTED_PERCENTAGE")
            defaults.synchronize()
        }
    }
    
    var selectedTheme = UserDefaults.standard.object(forKey: "SELECTED_THEME") as? String ?? "Light" {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(selectedTheme, forKey: "SELECTED_THEME")
            defaults.synchronize()
        }
    }
    
    let themes: [Themes] = [.light, .dark]
    let percentages: [Percentages] = [.low, .medium, .high]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm()
    }
    
    func setupForm() {
        form +++ SelectableSection<ListCheckRow<String>>("Default Percentage", selectionType: .singleSelection(enableDeselection: false))
        for option in percentages {
            form.last! <<< ListCheckRow<String>{ listRow in
                listRow.title = "\(Int(option.rawValue*100))%"
                listRow.selectableValue = "\(option.rawValue)"
                if option.rawValue == self.selectedPercentage {
                    listRow.value = "\(option.rawValue)"
                }
                } .onChange { row in
                    self.selectedPercentage = Double(row.value ?? "0") ?? 0.0
            }
        }
        
        form +++ SelectableSection<ListCheckRow<String>>("Appearance", selectionType: .singleSelection(enableDeselection: false))
        for option in themes {
            form.last! <<< ListCheckRow<String>(option.rawValue){ listRow in
                listRow.title = option.rawValue
                listRow.selectableValue = option.rawValue
                if option.rawValue == self.selectedTheme {
                    listRow.value = option.rawValue
                }
                } .onChange { row in
                    self.selectedTheme = row.value ?? ""
            }
        }
    }
}










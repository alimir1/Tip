//
//  SettingsViewController.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var excellentPercentageLabel: UILabel!
    @IBOutlet weak var satisfactoryPercentageLabel: UILabel!
    @IBOutlet weak var terriblePercentageLabel: UILabel!
    
    let settings = Settings.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePercentageLabels()
    }
    
    @IBAction func changeDefaultPercentage(sender: UIButton) {
        switch sender.tag {
        case 0:
            settings.decrementDefaultPercentage(of: .excellent)
        case 1:
            settings.incrementDefaultPercentage(of: .excellent)
        case 2:
            settings.decrementDefaultPercentage(of: .satisfactory)
        case 3:
            settings.incrementDefaultPercentage(of: .satisfactory)
        case 4:
            settings.decrementDefaultPercentage(of: .terrible)
        case 5:
            settings.incrementDefaultPercentage(of: .terrible)
        default: break
        }
        updatePercentageLabels()
    }
    
    @IBAction func reset(sender: UIButton) {
        settings.reset()
        updatePercentageLabels()
    }
    
    private func updatePercentageLabels() {
        excellentPercentageLabel.text = "\(settings.getDefaultExcellentPercentage())%"
        satisfactoryPercentageLabel.text = "\(settings.getDefaultSatisfactoryPercentage())%"
        terriblePercentageLabel.text = "\(settings.getDefaultTerriblePercentage())%"
    }
}

//
//  Tip.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Foundation

struct Tip {
    var tipPercentage: Int
    var billAmount: Double
    var numPeopleSharing: Int
    var selectedTipType: DefaultSettings
    
    var tipAmount: Double {
        return Double(tipPercentage)/100*billAmount
    }
    
    var totalAmount: Double {
        return tipAmount + billAmount
    }
    
    var totalAmountPerPerson: Double {
        return totalAmount/Double(numPeopleSharing)
    }
    
    init(percentage: Int = 20, billAmount: Double = 0.0, numPeopleSharing: Int = 4, selectedTipType: DefaultSettings) {
        self.tipPercentage = percentage
        self.billAmount = billAmount
        self.numPeopleSharing = numPeopleSharing
        self.selectedTipType = selectedTipType
    }
    
    init() {
        self.tipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
        self.billAmount = 0.00
        self.numPeopleSharing = 4
        self.selectedTipType = .satisfactory
    }
    
}

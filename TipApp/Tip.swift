//
//  Tip.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Foundation

class Tip {
    var billAmount: Double
    var numPeopleSharing: Int
    var selectedTipType: DefaultSettings
    var currentTipPercentage: Int
    
    var tipAmount: Double {
        return Double(currentTipPercentage)/100*billAmount
    }
    
    var totalAmount: Double {
        return tipAmount + billAmount
    }
    
    var totalAmountPerPerson: Double {
        return totalAmount/Double(numPeopleSharing)
    }
    
    init(billAmount: Double = 0.0, numPeopleSharing: Int = 4, selectedTipType: DefaultSettings) {
        self.billAmount = billAmount
        self.numPeopleSharing = numPeopleSharing
        self.selectedTipType = selectedTipType
        self.currentTipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
    }
    
    init() {
        self.billAmount = 0.00
        self.numPeopleSharing = 4
        self.selectedTipType = .satisfactory
        self.currentTipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
    }
    
    func getTipPercentage() -> Int {
        switch selectedTipType {
        case .terrible:
            return Settings.shared.getDefaultTerriblePercentage()
        case .excellent:
            return Settings.shared.getDefaultExcellentPercentage()
        case .satisfactory:
            return Settings.shared.getDefaultSatisfactoryPercentage()
        }
    }
    
    func resetTipPercentage() {
        currentTipPercentage = getTipPercentage()
    }
}

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
    var selectedTipType: Experiences
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
    
    init(billAmount: Double, numPeopleSharing: Int, defaultExperience: Experiences) {
        self.billAmount = billAmount
        self.numPeopleSharing = numPeopleSharing
        self.selectedTipType = defaultExperience
        self.currentTipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
    }
    
    init(defaultExperience: Experiences) {
        self.billAmount = 0.0
        self.numPeopleSharing = 4
        self.selectedTipType = defaultExperience
        self.currentTipPercentage = Settings.shared.getDefaultSatisfactoryPercentage()
        setBillAmountFromLastSave()
    }
    
    private func setBillAmountFromLastSave() {
        guard let savedDate = Settings.shared.getLatestSavedDate() else { return }
        let minsPassedSinceLastTerminate = abs(savedDate.timeIntervalSinceNow)/60
        if (minsPassedSinceLastTerminate) <= 10.00 {
            print("ISHRAQ: \(minsPassedSinceLastTerminate)")
            self.billAmount = Settings.shared.getLatestBillAmount()
        }
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

//
//  Settings.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Foundation


enum Experiences {
    case excellent
    case satisfactory
    case terrible
}

final class Settings {
    static let DEFAULT_EXCELLENT_PERCENTAGE = 20
    static let DEFAULT_SATISFACTORY_PERCENTAGE = 15
    static let DEFAULT_TERRIBLE_PERCENTAGE = 10
    
    static let shared = Settings()
    private init() {}
    
    func getDefaultExcellentPercentage() -> Int {
        return UserDefaults.standard.object(forKey: keywords.EXCELLENT_PERCENTAGE) as? Int ?? Settings.DEFAULT_EXCELLENT_PERCENTAGE
    }
    
    func getDefaultSatisfactoryPercentage() -> Int {
        return UserDefaults.standard.object(forKey: keywords.SATISFACTORY_PERCENTAGE) as? Int ?? Settings.DEFAULT_SATISFACTORY_PERCENTAGE
    }
    
    func getDefaultTerriblePercentage() -> Int {
        return UserDefaults.standard.object(forKey: keywords.TERRIBLE_PERCENTAGE) as? Int ?? Settings.DEFAULT_TERRIBLE_PERCENTAGE
    }
    
    func getLatestBillAmount() -> Double {
        return UserDefaults.standard.object(forKey: keywords.LATEST_BILL_AMOUNT) as? Double ?? 0.0
    }
    
    func getLatestSavedDate() -> NSDate? {
        return UserDefaults.standard.object(forKey: keywords.LATEST_SAVED_DATE) as? NSDate
    }
    
    internal func incrementDefaultPercentage(of type: Experiences) {
        changeDefaultPercentage(of: type, incrementDecrementValue: 1)
    }
    
    internal func decrementDefaultPercentage(of type: Experiences) {
        changeDefaultPercentage(of: type, incrementDecrementValue: -1)
    }
    
    private func changeDefaultPercentage(of type: Experiences, incrementDecrementValue value: Int) {
        switch type {
        case .excellent:
            if getDefaultExcellentPercentage() + value > 0 && getDefaultExcellentPercentage() + value <= 100 {
                changeDefaultPercentage(of: .excellent, percentage: getDefaultExcellentPercentage() + value)
            } else { break }
        case .satisfactory:
            if getDefaultSatisfactoryPercentage() + value > 0 && getDefaultSatisfactoryPercentage() + value <= 100 {
                changeDefaultPercentage(of: .satisfactory, percentage: getDefaultSatisfactoryPercentage() + value)
            } else { break }
        case .terrible:
            if getDefaultTerriblePercentage() + value > 0 && getDefaultTerriblePercentage() + value <= 100 {
                changeDefaultPercentage(of: .terrible, percentage: getDefaultTerriblePercentage() + value)
            } else { break }
        }
    }
    
    private func changeDefaultPercentage(of type: Experiences, percentage: Int) {
        let defaults = UserDefaults.standard
        switch type {
        case .excellent:
            defaults.set(percentage, forKey: keywords.EXCELLENT_PERCENTAGE)
        case .satisfactory:
            defaults.set(percentage, forKey: keywords.SATISFACTORY_PERCENTAGE)
        case .terrible:
            defaults.set(percentage, forKey: keywords.TERRIBLE_PERCENTAGE)
        }
        defaults.synchronize()
    }
    
    func saveLatestBillAmnt(_ amount: Double) {
        UserDefaults.standard.set(amount, forKey: keywords.LATEST_BILL_AMOUNT)
        UserDefaults.standard.synchronize()
    }
    
    func saveCurrentDate() {
        UserDefaults.standard.set(NSDate(), forKey: keywords.LATEST_SAVED_DATE)
        UserDefaults.standard.synchronize()
    }
    
    internal func reset() {
        let defaults = UserDefaults.standard
        defaults.set(Settings.DEFAULT_EXCELLENT_PERCENTAGE, forKey: keywords.EXCELLENT_PERCENTAGE)
        defaults.set(Settings.DEFAULT_SATISFACTORY_PERCENTAGE, forKey: keywords.SATISFACTORY_PERCENTAGE)
        defaults.set(Settings.DEFAULT_TERRIBLE_PERCENTAGE, forKey: keywords.TERRIBLE_PERCENTAGE)
        defaults.synchronize()
    }
    
    struct keywords {
        static let EXCELLENT_PERCENTAGE = "EXCELLENT_PERCENTAGE"
        static let SATISFACTORY_PERCENTAGE = "SATISFACTORY_PERCENTAGE"
        static let TERRIBLE_PERCENTAGE = "TERRIBLE_PERCENTAGE"
        static let LATEST_BILL_AMOUNT = "LATEST_BILL_AMOUNT"
        static let LATEST_SAVED_DATE = "LATEST_SAVED_DATE"
    }
    
}

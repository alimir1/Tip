//
//  Settings.swift
//  TipApp
//
//  Created by Ali Mir on 8/29/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Foundation


enum DefaultSettings {
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
        return UserDefaults.standard.object(forKey: keywords.DEFAULT_EXCELLENT_PERCENTAGE) as? Int ?? Settings.DEFAULT_EXCELLENT_PERCENTAGE
    }
    
    func getDefaultSatisfactoryPercentage() -> Int {
        return UserDefaults.standard.object(forKey: keywords.DEFAULT_SATISFACTORY_PERCENTAGE) as? Int ?? Settings.DEFAULT_SATISFACTORY_PERCENTAGE
    }
    
    func getDefaultTerriblePercentage() -> Int {
        return UserDefaults.standard.object(forKey: keywords.DEFAULT_TERRIBLE_PERCENTAGE) as? Int ?? Settings.DEFAULT_TERRIBLE_PERCENTAGE
    }
    
    internal func incrementDefaultPercentage(of type: DefaultSettings) {
        changeDefaultPercentage(of: type, incrementDecrementValue: 1)
    }
    
    internal func decrementDefaultPercentage(of type: DefaultSettings) {
        changeDefaultPercentage(of: type, incrementDecrementValue: -1)
    }
    
    private func changeDefaultPercentage(of type: DefaultSettings, incrementDecrementValue value: Int) {
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
    
    private func changeDefaultPercentage(of type: DefaultSettings, percentage: Int) {
        let defaults = UserDefaults.standard
        switch type {
        case .excellent:
            defaults.set(percentage, forKey: keywords.DEFAULT_EXCELLENT_PERCENTAGE)
        case .satisfactory:
            defaults.set(percentage, forKey: keywords.DEFAULT_SATISFACTORY_PERCENTAGE)
        case .terrible:
            defaults.set(percentage, forKey: keywords.DEFAULT_TERRIBLE_PERCENTAGE)
        }
        defaults.synchronize()
    }
    
    internal func reset() {
        let defaults = UserDefaults.standard
        defaults.set(Settings.DEFAULT_EXCELLENT_PERCENTAGE, forKey: keywords.DEFAULT_EXCELLENT_PERCENTAGE)
        defaults.set(Settings.DEFAULT_SATISFACTORY_PERCENTAGE, forKey: keywords.DEFAULT_SATISFACTORY_PERCENTAGE)
        defaults.set(Settings.DEFAULT_TERRIBLE_PERCENTAGE, forKey: keywords.DEFAULT_TERRIBLE_PERCENTAGE)
    }
    
    struct keywords {
        static let DEFAULT_EXCELLENT_PERCENTAGE = "DEFAULT_EXCELLENT_PERCENTAGE"
        static let DEFAULT_SATISFACTORY_PERCENTAGE = "DEFAULT_SATISFACTORY_PERCENTAGE"
        static let DEFAULT_TERRIBLE_PERCENTAGE = "DEFAULT_TERRIBLE_PERCENTAGE"
    }
    
}

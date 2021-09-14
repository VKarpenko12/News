//
//  MainTabBar.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

enum MainTab: Int {
    case current
    case other
    
    var title: String {
        switch self {
            case .current:
                return localizableString.currentTabTitle()
                
            case .other:
                return localizableString.otherTabTitle()
        }
    }
    
    var index: Int {
        rawValue
    }
}

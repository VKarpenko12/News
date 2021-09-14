//
//  NewsString.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

let localizableString = NewsLocalizableString()

final class NewsLocalizableString {
    
    // MARK: - MainTab

    func currentTabTitle() -> String {
        R.string.localizable.mainTabCurrentTitle()
    }
    
    func otherTabTitle() -> String {
        R.string.localizable.mainTabOtherTitle()
    }
    
    // MARK: - Main
    // MARK: NewsListViewController
    
    func newsTitle() -> String {
        R.string.localizable.newsTitle()
    }

    // MARK: OtherNewsViewController

    func otherNewsTitle() -> String {
        R.string.localizable.otherNewsTitle()
    }
}

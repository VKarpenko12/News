//
//  OtherNewsViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import Foundation

final class OtherNewsListViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var tabType: NewsListTabType = .everything
    
    // MARK: - Appearance
    
    func getTitle() -> String {
        localizableString.otherNewsTitle()
    }
}

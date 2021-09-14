//
//  BaseNewsViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

class BaseNewsViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    let networkService = NetworkService()
    
    // MARK: Callback
    
    var didLoad: DidLoad?
    var willAppearError: WillAppearError?

    // MARK: Network
    
    func getNews() {  }
}

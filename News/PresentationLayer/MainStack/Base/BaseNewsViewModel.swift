//
//  BaseNewsViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class BaseNewsViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private let networkService = NetworkService()
    private var items = [NewsCellViewModel]()
    
    // MARK: Callback
    
    var didLoad: DidLoad?
    var willAppearError: WillAppearError?
}

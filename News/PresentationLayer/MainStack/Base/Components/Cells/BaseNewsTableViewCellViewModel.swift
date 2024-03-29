//
//  BaseNewsTableViewCellViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

class BaseNewsTableViewCellViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var news: DisplayArticle
    
    // MARK: - Initialization
    
    init(news: DisplayArticle) {
        self.news = news
    }
    
    // MARK: - Appearance
    
    func getCoverImageURL() -> URL? {
        URL(string: news.urlToImage ?? "")
    }
}

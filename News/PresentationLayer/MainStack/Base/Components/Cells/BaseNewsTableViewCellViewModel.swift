//
//  BaseNewsTableViewCellViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class BaseNewsTableViewCellViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var news: DisplayArticle
    
    // MARK: - Initialization
    
    init(news: DisplayArticle) {
        self.news = news
    }
    
    // MARK: - Appearance
    
    func getTitle() -> String {
        news.title ?? ""
    }
    
    func getDescription() -> String {
        news.description ?? news.content ?? " "
    }
    
    func getCoverImageURL() -> URL? {
        URL(string: news.urlToImage ?? "")
    }
}

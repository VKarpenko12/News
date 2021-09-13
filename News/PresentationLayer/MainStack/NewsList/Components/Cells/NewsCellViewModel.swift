//
//  NewsCellViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import Foundation

final class NewsCellViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var news: Article
    
    // MARK: - Initialization
    
    init(news: Article) {
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

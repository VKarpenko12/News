//
//  NewsListViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

final class NewsListViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private let networkService = NetworkService()
    private var items = [NewsCellViewModel]()
    
    // MARK: Callback
    
    var didLoad: DidLoad?
    var willAppearError: WillAppearError?
    
    // MARK: - Appearance
    
    func getTitle() -> String {
        localizableString.newsTitle()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func item(at index: Int) -> NewsCellViewModel {
        items[index]
    }
    
    // MARK: Network
    
    func getNews() {
        networkService.getArticles { [weak self] response in
            guard let self = self else { return }
            
            switch response {
                case .success(let model):
                    self.items = model.articles.map {
                        NewsCellViewModel(news: $0)
                    }
                    
                    self.didLoad?()
                case .failure(let error):
                    self.willAppearError?(error)
            }
        }
    }
}

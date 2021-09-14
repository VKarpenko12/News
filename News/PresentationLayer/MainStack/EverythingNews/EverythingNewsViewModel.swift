//
//  EverythingNewsViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class EverythingNewsViewModel: BaseNewsViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private var items = [EverythingNewsCellViewModel]()
    
    // MARK: - Appearance
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func item(at index: Int) -> EverythingNewsCellViewModel {
        items[index]
    }
    
    // MARK: Network
    
    override func getNews() {
        networkService.getEverythingNews(topic: "bitcoin") { [weak self] response in
            guard let self = self else { return }
            
            switch response {
                case .success(let model):
                    self.items = model.articles.map {
                        EverythingNewsCellViewModel(news: $0)
                    }
                    
                    self.didLoad?()
                case .failure(let error):
                    self.willAppearError?(error)
            }
        }
    }
}

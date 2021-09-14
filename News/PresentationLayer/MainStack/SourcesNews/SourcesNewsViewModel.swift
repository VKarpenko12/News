//
//  SourcesNewsViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class SourcesNewsViewModel: BaseNewsViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private var items = [SourcesNewsCellViewModel]()
    
    // MARK: - Appearance
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func item(at index: Int) -> SourcesNewsCellViewModel {
        items[index]
    }
    
    // MARK: Network
    
    override func getNews() {
        networkService.getSorcesNews { [weak self] response in
            guard let self = self else { return }
            
            switch response {
                case .success(let model):
                    self.items = model.sources.map {
                        SourcesNewsCellViewModel(news: $0)
                    }
                    
                    self.didLoad?()
                    
                case .failure(let error):
                    self.willAppearError?(error)
            }
        }
    }
}

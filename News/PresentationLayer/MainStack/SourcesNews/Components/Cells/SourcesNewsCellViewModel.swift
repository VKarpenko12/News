//
//  SourcesNewsCellViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class SourcesNewsCellViewModel: BaseNewsTableViewCellViewModel {
    
    // MARK: - Appearance
    
    func getTitle() -> String {
        news.title ?? ""
    }
    
    func getDescription() -> String {
        news.description ?? news.content ?? " "
    }
}

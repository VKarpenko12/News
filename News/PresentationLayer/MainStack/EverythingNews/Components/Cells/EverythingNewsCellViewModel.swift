//
//  EverythingNewsCellViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class EverythingNewsCellViewModel: BaseNewsTableViewCellViewModel {
    
    // MARK: - Appearance
    
    func getTitle() -> String {
        news.title ?? ""
    }
}

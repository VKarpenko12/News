//
//  EverythingNewsViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class EverythingNewsViewController: BaseNewsViewController<
    EverythingNewsViewModel
> {
    
    // MARK: - Types
    
    typealias DidSelect = (DisplayArticle) -> Void
    
    // MARK: - Properties
    // MARK: Callbacks
        
    var didSelect: DidSelect?

    // MARK: Provider
    
    private lazy var provider = EverythingNewsTableProvider(
        tableView: tableView,
        viewModel: viewModel
    ).apply {
        $0.didTap = { [unowned self] news in
            self.didSelect?(news)
        }
    }
}

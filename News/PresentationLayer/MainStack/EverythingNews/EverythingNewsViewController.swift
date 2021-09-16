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
    
    // MARK: - Properties
    // MARK: Provider
    
    private lazy var provider = EverythingNewsTableProvider(
        tableView: tableView,
        viewModel: viewModel
    ).apply {
        $0.didTap = { [unowned self] news in
            self.didSelect?(news)
        }
    }
    
    // MARK: - Configure
    
    override func reloadData() {
        provider.reloadData()
    }
}

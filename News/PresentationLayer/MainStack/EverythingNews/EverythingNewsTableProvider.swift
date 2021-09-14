//
//  EverythingNewsTableProvider.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

final class EverythingNewsTableProvider: TableViewProvider<
    UITableView,
    EverythingNewsViewModel
> {
    
    // MARK: - Types
    
    typealias DidTap = ((DisplayArticle) -> Void)
    
    // MARK: - Properties
    // MARK: Callbacks

    var didTap: DidTap?
    
    // MARK: - Configuration
    
    override func configureTableView() {
        tableView?.register(
            EverythingNewsCell.self,
            forCellReuseIdentifier: String(describing: EverythingNewsCell.self)
        )
    
        super.configureTableView()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfItems()
    }
    
    override func numberOfSections(in _: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: EverythingNewsCell.self),
            for: indexPath
        ) as? EverythingNewsCell else {
            return EverythingNewsCell()
        }
        
        let item = viewModel.item(at: indexPath.row)
            
        cell.configure(with: item)

        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTap?(viewModel.item(at: indexPath.row).news)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

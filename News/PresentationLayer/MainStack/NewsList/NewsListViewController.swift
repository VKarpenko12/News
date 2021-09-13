//
//  NewsListViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import UIKit
import IHProgressHUD

final class NewsListViewController: BaseViewController {
    
    // MARK: - Types
    
    typealias Provider = NewsTableProvider
    typealias DidSelectNews = (Article) -> Void
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel = NewsListViewModel()
    
    // MARK: Callbacks
    
    var didSelectNews: DidSelectNews?
    
    // MARK: Views
    
    private(set) lazy var tableView = UITableView(
        frame: .zero,
        style: .plain
    ).apply {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.keyboardDismissMode = .onDrag
    }
    
    // MARK: Provider
    
    private lazy var provider = Provider(
        tableView: tableView,
        viewModel: viewModel
    ).apply {
        $0.didTap = {
            
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
        IHProgressHUD.show()
        viewModel.getNews()
    }
    
    // MARK: Configure
    
    private func configure() {
        view.backgroundColor = .white
        title = viewModel.getTitle()
        
        condigureViewModle()
        
        attachTableView()
    }
    
    private func condigureViewModle() {
        viewModel.didLoad = { [weak self] in
            IHProgressHUD.dismiss()
            self?.provider.reloadData()
        }
        
        viewModel.willAppearError = { error in
            IHProgressHUD.showError(withStatus: error.localizedDescription )
        }
    }
    
    private func attachTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(view.safeAreaLayoutGuide)
            maker.leading.trailing.equalToSuperview()
        }
    }
}

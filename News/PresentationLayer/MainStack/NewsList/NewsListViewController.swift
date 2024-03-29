//
//  NewsListViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import UIKit
import IHProgressHUD

final class NewsListViewController: BaseViewController {
    
    // MARK: - Types
    
    typealias Provider = NewsTableProvider
    typealias DidSelectNews = (DisplayArticle) -> Void
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel = NewsListViewModel()
    private let refreshControl = UIRefreshControl().apply {
        $0.addTarget(self, action: #selector(didPull), for: .valueChanged)
    }

    // MARK: Callbacks
    
    var didSelectNews: DidSelectNews?
    
    // MARK: Views
    
    private(set) lazy var tableView = UITableView(
        frame: .zero,
        style: .plain
    ).apply {
        $0.backgroundColor = Color.clear
        $0.separatorStyle = .none
        $0.keyboardDismissMode = .onDrag
        $0.contentInset = .init(top: 1, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: Provider
    
    private lazy var provider = Provider(
        tableView: tableView,
        viewModel: viewModel
    ).apply {
        $0.didTap = { [unowned self] news in
            self.didSelectNews?(news)
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
        reloadData()
    }
    
    private func reloadData() {
        IHProgressHUD.show()
        viewModel.getNews()
    }
    
    // MARK: Configure
    
    private func configure() {
        view.backgroundColor = Color.white
        title = viewModel.getTitle()
        
        condigureViewModel()
        attachTableView()
    }
    
    private func condigureViewModel() {
        viewModel.didLoad = { [weak self] in
            IHProgressHUD.dismiss()
            self?.refreshControl.endRefreshing()
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
        
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - Actions
    
    @objc
    func didPull() {
        reloadData()
    }
}

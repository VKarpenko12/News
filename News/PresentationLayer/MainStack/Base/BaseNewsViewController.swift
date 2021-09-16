//
//  BaseNewsViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit
import IHProgressHUD

class BaseNewsViewController<
ViewModel: BaseNewsViewModel
>: UIViewController {
    
    // MARK: - Types
    
    typealias DidSelect = (DisplayArticle) -> Void
    
    // MARK: - Properties
    // MARK: Content
    
    let viewModel: ViewModel
    
    // MARK: Callbacks
    
    var didSelect: DidSelect?
    
    // MARK: Views
    
    private let refreshControl = UIRefreshControl().apply {
        $0.addTarget(self, action: #selector(didPull), for: .valueChanged)
    }
    
    private(set) lazy var tableView = UITableView(frame: .zero, style: .plain).apply {
        $0.backgroundColor = .clear
        $0.backgroundView = UIView().apply {
            $0.backgroundColor = .clear
        }
        
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.clipsToBounds = true
    }
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        updateData()
    }
    
    // MARK: - Configuration
    
    private func configure() {
        condigureViewModel()
        attachTableView()
    }
    
    private func attachTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.layoutMarginsGuide)
        }
        
        tableView.addSubview(refreshControl)
    }
    
    private func condigureViewModel() {
        viewModel.didLoad = { [weak self] in
            IHProgressHUD.dismiss()
            self?.refreshControl.endRefreshing()
            self?.reloadData()
        }
        
        viewModel.willAppearError = { error in
            IHProgressHUD.showError(withStatus: error.localizedDescription )
        }
    }
    
    private func updateData() {
        IHProgressHUD.show()
        viewModel.getNews()
    }
    
    func reloadData() { }
    
    // MARK: - Actions
    
    @objc
    func didPull() {
        updateData()
    }
}

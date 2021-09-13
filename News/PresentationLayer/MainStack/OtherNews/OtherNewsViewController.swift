//
//  OtherNewsViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import UIKit
import IHProgressHUD

final class OtherNewsViewController: BaseViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel = OtherNewsListViewModel()
    
    // MARK: Callbacks
        
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

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    
    // MARK: Configure
    
    private func configure() {
        view.backgroundColor = Color.white
        
        condigureViewModle()
        
        attachTableView()
    }
    
    private func condigureViewModle() {
//        viewModel.didLoad = { [weak self] in
//            IHProgressHUD.dismiss()
//            self?.provider.reloadData()
//        }
//        
//        viewModel.willAppearError = { error in
//            IHProgressHUD.showError(withStatus: error.localizedDescription )
//        }
    }
    
    private func attachTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(view.safeAreaLayoutGuide)
            maker.leading.trailing.equalToSuperview()
        }
    }
}

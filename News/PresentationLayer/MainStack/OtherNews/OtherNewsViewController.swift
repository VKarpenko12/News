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
    
    private var switchView = NewsTabBarView().apply {
        $0.backgroundColor = Color.clear
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    
    // MARK: Configure
    
    private func configure() {
        view.backgroundColor = Color.white
        
        condigureViewModel()
        
        attachSwitchView()
    }
    
    private func condigureViewModel() {
//        viewModel.didLoad = { [weak self] in
//            IHProgressHUD.dismiss()
//            self?.provider.reloadData()
//        }
//        
//        viewModel.willAppearError = { error in
//            IHProgressHUD.showError(withStatus: error.localizedDescription )
//        }
    }
    
    private func attachSwitchView() {
        view.addSubview(switchView)
        
        switchView.snp.makeConstraints { maker in
            maker.top.equalTo(view.layoutMarginsGuide)
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(50)
        }
    }
}

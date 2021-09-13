//
//  MainCoordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import Foundation

class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    // MARK: Content
    
    var navigationController: BaseNavigationController

    // MARK: Callbacks

    var didStart: EmptyClosure?
    var didFinish: EmptyClosure?
    
    
    // MARK: - Initialization
    
    init(
        navigationController: BaseNavigationController = BaseNavigationController()
    ) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - Coordinator
    
    func start(animated: Bool) {
        let newsListVC = NewsListViewController()
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([newsListVC], animated: true)
    }
    
    func stop() {
        navigationController.removeFromParent()
    }
    
    
    // MARK: - ViewControllers

    private func showNewsDetailViewController(_ arcticle: Article) {
        let viewModel = NewsDetailViewModel(news: arcticle)
        let viewController = NewsDetailViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}


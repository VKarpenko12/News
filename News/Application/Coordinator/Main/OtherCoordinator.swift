//
//  OtherCoordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

final class OtherCoordinator: Coordinator {
    
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
        let newsListVC = OtherNewsViewController()
        
        newsListVC.didSelect = { [unowned self] news in
            self.showNewsDetailViewController(news)
        }
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([newsListVC], animated: true)
    }
    
    func stop() {
        navigationController.removeFromParent()
    }
    
    // MARK: - ViewControllers

    private func showNewsDetailViewController(_ arcticle: DisplayArticle) {
        let viewModel = NewsDetailViewModel(news: arcticle)
        let viewController = NewsDetailViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}



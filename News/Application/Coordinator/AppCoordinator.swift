//
//  AppCoordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    // MARK: Content

    let viewModel: AppCoordinatorViewModel
    var navigationController: BaseNavigationController
    private lazy var mainTabCoordinator = configureMainTabCoordinator()
    
    // MARK: Callbacks
    
    var didStart: EmptyClosure?
    var didFinish: EmptyClosure?
    
    // MARK: - Initialization

    init(
        viewModel: AppCoordinatorViewModel,
        navigationController: BaseNavigationController
    ) {
        self.viewModel = viewModel
        self.navigationController = navigationController
        
        viewModel.configure()
    }
    
    // MARK: Start
    
    func start(animated _: Bool) {
        let type = viewModel.content.authenticationType
        
        switch type {
            case .main:
                startWithCoordinator(mainTabCoordinator)
        }
    }
    
    private func startWithCoordinator(_ coordinator: Coordinator) {
        viewModel.window.rootViewController = coordinator.navigationController
        coordinator.start(animated: true)
        
        viewModel.window.makeKeyAndVisible()
    }
    
    private func configureMainTabCoordinator() -> MainTabCoordinator {
        MainTabCoordinator()
    }
    
    // MARK: Stop
    
    func stop() {}
}

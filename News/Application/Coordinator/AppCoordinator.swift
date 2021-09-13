//
//  AppCoordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import Foundation

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var didStart: EmptyClosure?
    var didFinish: EmptyClosure?
    
    let viewModel: AppCoordinatorViewModel
    var navigationController: BaseNavigationController
    
    
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
                let mainCoordinator = MainCoordinator()
                startWithCoordinator(mainCoordinator)
        }
        
        viewModel.window.makeKeyAndVisible()
    }
    
    func startWithCoordinator(_ coordinator: Coordinator) {
        viewModel.window.rootViewController = coordinator.navigationController
        coordinator.start(animated: true)
        
        viewModel.window.makeKeyAndVisible()
    }
    
    // MARK: Stop
    
    func stop() {}
}

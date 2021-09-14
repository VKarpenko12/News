//
//  MainTabCoordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import UIKit

final class MainTabCoordinator: Coordinator {
    
    // MARK: - Properties
    // MARK: Content
    
    lazy var currentCoordinator = configureCurrentCoordanator()
    lazy var anotherCoordinator = configureAnotherCoordinator()
    private var state: MainTab

    // MARK: Callbacks

    var didStart: EmptyClosure?
    var didFinish: EmptyClosure?
    var navigationController: BaseNavigationController

    // MARK: - Life cycle
    
    init(
        navigationController: BaseNavigationController = BaseNavigationController(),
        state: MainTab = .current
    ) {
        self.navigationController = navigationController
        self.state = state
    }
    
    // MARK: - Coordinator
    
    func start(animated: Bool) {
        let mainTabBarController = MainTabBarController()
        
        mainTabBarController.viewControllers = [
            currentCoordinator.navigationController,
            anotherCoordinator.navigationController,
        ]
                
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([mainTabBarController], animated: true)
    }
    
    func stop() {
        navigationController.removeFromParent()
    }

    // MARK: Tabs
        
    private func configureCurrentCoordanator() -> Coordinator {
        let coordinator = CurrentCoordinator()

        let navigationController = BaseNavigationController()
        navigationController.tabBarItem = UITabBarItem(title: MainTab.current.title, image: R.image.current(), selectedImage: R.image.currentSelectedIcon())
        coordinator.navigationController = navigationController
        
        coordinator.start(animated: true)
        
        return coordinator
    }
    
    private func configureAnotherCoordinator() -> Coordinator {
        let coordinator = OtherCoordinator()

        let navigationController = BaseNavigationController()
        navigationController.tabBarItem = UITabBarItem(title: MainTab.other.title, image: R.image.other(), selectedImage: R.image.otherSelectedIcon())
        coordinator.navigationController = navigationController
        
        coordinator.start(animated: true)
        
        return coordinator
    }
}

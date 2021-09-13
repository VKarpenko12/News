//
//  MainTabBarController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import UIKit

// MARK: - Types

enum MainTab: Int {
    case current
    case ather
    
    var title: String {
        switch self {
            case .current:
                return "Local News"
            case .ather:
                return "Ather News"
        }
    }
    
    var index: Int {
        rawValue
    }
}

// MARK: - TabBar

final class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    // MARK: Content
    
    var selectedUserTab: MainTab {
        get { MainTab(rawValue: selectedIndex) ?? .current }
        set { selectedIndex = newValue.rawValue }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        configureTabBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: Configure

    func configureTabBar() {
        tabBar.backgroundImage = UIImage()
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        true
    }
}

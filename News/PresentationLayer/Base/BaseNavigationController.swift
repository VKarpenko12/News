//
//  BaseNavigationController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
    }

    // MARK: Configure
    
    private func prepareNavigationBar() {
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .clear
    }
}

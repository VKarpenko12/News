//
//  AuthorizationViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import UIKit

final class AppCoordinatorViewModel: BaseFlowViewModel<AppCoordinatorContent> {
    
    // MARK: - Properties
    
    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    
    // MARK: - Configuration

    override func configure() {
        super.configure()

        updateAuthenticationType()
    }
    
    private func updateAuthenticationType() {
        content.authenticationType = .main
    }
}

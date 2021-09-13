//
//  AppCoordinatorContent.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import Foundation

protocol FlowContent {}

final class AppCoordinatorContent: FlowContent {
    // MARK: - Properties
    // MARK: Content
    
    var authenticationType: AuthenticationType
    

    // MARK: - Initialization

    init(authenticationType: AuthenticationType = .main) {
        self.authenticationType = authenticationType
    }
}


// MARK: - Types

enum AuthenticationType {
    case main
}

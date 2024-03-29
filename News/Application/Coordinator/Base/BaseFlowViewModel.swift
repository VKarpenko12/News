//
//  BaseFlowViewModel.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

class BaseFlowViewModel<Content: FlowContent> {
    
    // MARK: - Properties
    // MARK: Content
    
    let content: Content
    
    // MARK: - Initialization
    
    init(content: Content) {
        self.content = content
    }
    
    // MARK: - Appearance
    
    func configure() {}
}

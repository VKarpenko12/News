//
//  Coordinator.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

protocol Coordinator: AnyObject {
    
    // MARK: - Properties
    // MARK: Content

    var navigationController: BaseNavigationController { get }

    // MARK: Callbacks

    var didStart: EmptyClosure? { get set }
    var didFinish: EmptyClosure? { get set }
    
    // MARK: - Appearance

    func start(animated: Bool)
    func stop()
}

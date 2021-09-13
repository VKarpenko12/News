//
//  BaseViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    var screenStatusBarStyle: UIStatusBarStyle = .default
    private var _statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
            navigationController?.navigationBar.barStyle = _statusBarStyle == .lightContent
                ? .black
                : .default
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return _statusBarStyle
    }
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        _statusBarStyle = screenStatusBarStyle
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        _statusBarStyle = .default
    }
}


// MARK: - Extensions

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension UITabBarController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
}

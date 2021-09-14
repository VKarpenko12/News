//
//  BaseNewsViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

class BaseNewsViewController<
    ViewModel: BaseNewsViewModel
>: UIViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    let viewModel: ViewModel
    
    // MARK: Callbacks
    
    var willAppear: EmptyClosure?
    
    // MARK: Views
    
    private(set) lazy var tableView = UITableView(frame: .zero, style: .plain).apply {
        $0.backgroundColor = .clear
        $0.backgroundView = UIView().apply {
            $0.backgroundColor = .clear
        }
        
        $0.separatorStyle = .none
        $0.clipsToBounds = true
    }
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        willAppear?()
    }
    
    // MARK: - Configuration
    
//    override func configureView() {
//        super.configureView()
//        
//    }
    
    // MARK: - ViewModel
    // MARK: Updates
    
    func loadContent() { }
    
    func reloadContent() { }
}

//
//  OtherNewsViewController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import UIKit
import IHProgressHUD

final class OtherNewsViewController: BaseViewController {
    
    // MARK: - Types
    
    typealias DidSelect = (DisplayArticle) -> Void
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel = OtherNewsListViewModel()
    
    // MARK: Callbacks
    
    var didSelect: DidSelect?

    // MARK: Views
    
    private lazy var switchView = NewsTabBarView().apply {
        $0.backgroundColor = Color.white
        $0.didSelectTab = { [unowned self] type in
            self.changeTab(to: type)
        }
    }
    
    private(set) lazy var everythingNewsViewController = setEverythingNewsViewController()
    private(set) lazy var sourcesNewsViewController = setSourcesNewsViewController()
    private(set) lazy var childs = [
        everythingNewsViewController,
        sourcesNewsViewController
    ]
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configurateChildViewController(viewController: everythingNewsViewController)
    }
    
    // MARK: Configure
    
    private func configure() {
        title = viewModel.getTitle()

        view.backgroundColor = Color.white
                
        attachSwitchView()
    }
    
    private func attachSwitchView() {
        view.addSubview(switchView)
        
        switchView.snp.makeConstraints { maker in
            maker.top.equalTo(view.layoutMarginsGuide)
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(50)
        }
    }
    
    // MARK: Slide VCs
    
    private func setEverythingNewsViewController() -> EverythingNewsViewController {
        let viewController = EverythingNewsViewController(
            viewModel: EverythingNewsViewModel()
        )
            
        viewController.didSelect = { [unowned self] news in
            self.didSelect?(news)
        }
        
        return viewController
    }
    
    private func setSourcesNewsViewController() -> SourcesNewsViewController {
        let viewController = SourcesNewsViewController(
            viewModel: SourcesNewsViewModel()
        )
        
        viewController.didSelect = { [unowned self] news in
            self.didSelect?(news)
        }
        
        return viewController
    }
    
    // MARK: - Actions
    
    private func configurateChildViewController(viewController: UIViewController) {
        addChild(viewController)
        
        view.addSubview(viewController.view)

        viewController.view.snp.makeConstraints { maker in
            maker.top.equalTo(view.layoutMarginsGuide.snp.top).offset(50)
            maker.leading.trailing.bottom.equalToSuperview()
        }
        
        viewController.didMove(toParent: self)
    }
    
    private func removeChildViewController(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: self)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func changeTab(
        to type: NewsListTabType
    ) {
        let selectedTab = childs[type.rawValue]
        let deselerctedTab = childs[viewModel.tabType.rawValue]
        
        if type != viewModel.tabType {
            removeChildViewController(asChildViewController: deselerctedTab)
            configurateChildViewController(viewController: selectedTab)
        }
        
        viewModel.tabType = type
    }
}

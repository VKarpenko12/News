//
//  NewsTabBarView.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import UIKit

// MARK: - Enums

enum NewsListTabType: Int {
    case everything
    case sources
    
    var title: String {
        switch self {
            case .everything:
                return "EVERYTHING"
            case .sources:
                return "SOURCES"
        }
    }
}

final class NewsTabBarView: UIView {
    
    // MARK: - Types
    
    typealias DidSelectTab = (NewsListTabType) -> Void

    // MARK: - Properties
    // MARK: Callbacks
    
    var didSelectTab: DidSelectTab?
    
    // MARK: Views
    
    private lazy var conteinerViewForSwitch = UIView().apply {
        $0.backgroundColor = Color.white
    }
    
    private lazy var lineView = UIView().apply {
        $0.backgroundColor = Color.grayLight
    }
    
    private lazy var selectedLineView = UIView().apply {
        $0.backgroundColor = Color.primary
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 1.5
    }
    
    private lazy var everythingButton = UIButton().apply {
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(buttonTouchedUpInside), for: .touchUpInside)
        $0.setTitle(NewsListTabType.everything.title, for: .normal)
        $0.titleLabel?.font = Font.sfTextSemibold(size: 14)
        $0.setTitleColor(Color.black, for: .normal)
    }
    
    private lazy var sourcesButton = UIButton().apply {
        $0.setTitle(NewsListTabType.sources.title, for: .normal)
        $0.addTarget(self, action: #selector(buttonTouchedUpInside), for: .touchUpInside)
        $0.titleLabel?.font = Font.sfTextSemibold(size: 14)
        $0.setTitleColor(Color.primary, for: .normal)
    }
    
    private lazy var buttonsArray = [
        everythingButton,
        sourcesButton
    ]
    
    // MARK: - Initialzaition
    
    init() {
        super.init(frame: .zero)
        
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
        
    // MARK: - Appearance
    
    func change(to tab: NewsListTabType) {
        let tabButton = buttonsArray[tab.rawValue]
        
        if let selectedIndex = tabButtonIndex(tabButton) {
            applyTabButtonStyles(with: selectedIndex)
            animationMovingLine(type: tab, duration: 0)
        }
    }
    
    // MARK: - Configurate
    
    func configurateUI() {
        configurateSwitchView()
    }
    
    private func configurateSwitchView() {
        addSubview(conteinerViewForSwitch)
    
        conteinerViewForSwitch.snp.makeConstraints { maker in
            maker.leading.equalTo(20)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(80)
            maker.trailing.equalTo(-20)
        }
        
        attachEverythingButto()
        attachSourcesButton()
        configurateSelectedLineView()
        attachLineView()
    }
    
    private func attachEverythingButto() {
        conteinerViewForSwitch.addSubview(everythingButton)
                
        everythingButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview().inset(20)
            maker.height.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func attachSourcesButton() {
        conteinerViewForSwitch.addSubview(sourcesButton)
        
        sourcesButton.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview()
            maker.top.equalToSuperview().inset(20)
            maker.height.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func attachLineView() {
        conteinerViewForSwitch.addSubview(lineView)
        
        lineView.snp.makeConstraints { maker in
            maker.height.equalTo(1)
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(57)
        }
    }
    
    
    private func configurateSelectedLineView() {
        conteinerViewForSwitch.addSubview(selectedLineView)
        
        let width = UIScreen.main.bounds.width
        
        selectedLineView.frame = CGRect(x: width / 8 - 10, y: 55, width: 100, height: 3)
    }
    
    // MARK: - Actions
    
    func animationMovingLine(type: NewsListTabType, duration: TimeInterval = 0.1) {
        switch type {
        case .everything:
            UIView.animate(withDuration: 0.1) { [unowned self] in
                self.selectedLineView.center.x = self.conteinerViewForSwitch.center.x / 2 - 10
            }
        case .sources:
            UIView.animate(withDuration: 0.1) { [unowned self] in
                self.selectedLineView.center.x = self.conteinerViewForSwitch.center.x / 2 * 3 - 30
            }
        }
    }
    
    @objc
    private func buttonTouchedUpInside(_ sender: UIButton) {
        if let selectedIndex = tabButtonIndex(sender) {
            applyTabButtonStyles(with: selectedIndex)
            
            if let type = NewsListTabType(rawValue: selectedIndex) {
                didSelectTab?(type)
                
                animationMovingLine(type: type)
            }
        }
    }
    
    private func tabButtonIndex(_ button: UIButton) -> Int? {
        buttonsArray.firstIndex(of: button)
    }
    
    private func applyTabButtonStyles(
        with selectedIndex: Int
    ) {
        buttonsArray.enumerated().forEach { index, button in
            applyTabButtonStyle(button, isSelected: index == selectedIndex)
        }
    }
    
    private func applyTabButtonStyle(
        _ button: UIButton,
        isSelected: Bool
    ) {
        button.setTitleColor(
            isSelected ? Color.black : Color.systemLightGray,
            for: .normal
        )
    }
}

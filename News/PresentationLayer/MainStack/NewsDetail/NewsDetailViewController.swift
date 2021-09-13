//
//  NewsDetailVieController.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import UIKit
import IHProgressHUD

final class NewsDetailViewController: BaseViewController {
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel: NewsDetailViewModel
    
    // MARK: Views
    
    private var coverImageView = UIImageView().apply {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
    }
    
    private var descriptionLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    // MARK: - Initialization
    
    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
    
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.getTitle()
        configure()
    }
    
    // MARK: Configure
    
    private func configure() {
        view.backgroundColor = .white
        attachCoverImageView()
        attachDescriptionLabel()
        
        setData()
    }
    
    private func setData() {
        title = viewModel.getTitle()
        descriptionLabel.text = viewModel.getDescription()
        
        guard let url = viewModel.getCoverImageURL() else { return }
        
        coverImageView.kf.set(
            resource: url
        )
    }
    
    private func attachCoverImageView() {
        view.addSubview(coverImageView)
        
        coverImageView.snp.makeConstraints { maker in
            maker.height.equalTo(250)
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            maker.leading.trailing.equalToSuperview().inset(14)
        }
    }
    
    private func attachDescriptionLabel() {
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(coverImageView.snp.bottom).offset(15)
            maker.leading.trailing.equalToSuperview().inset(14)
        }
    }
}

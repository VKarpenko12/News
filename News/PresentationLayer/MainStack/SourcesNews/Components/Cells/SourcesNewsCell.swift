//
//  SourcesNewsCell.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

final class SourcesNewsCell: BaseNewsTableViewCell {
    
    // MARK: - Properties
    // MARK: Content
    
    var viewModel: SourcesNewsCellViewModel?
    
    // MARK: Views
    
    private(set) var titleLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = Color.white
        $0.font = Font.sfDisplayBold(size: 18)
    }
    
    private(set) var descriptionLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = Color.white
        $0.numberOfLines = 3
        $0.font = Font.sfTextMedium(size: 13)
    }
    
    // MARK: - Configuration 
    
    override func configure() {
        super.configure()
        
        attachTitleLabel()
        attachDescriptionLabel()
    }
    
    override func attachCoverImageView() {
        super.attachCoverImageView()
        
        coverImageView.snp.removeConstraints()
        
        coverImageView.snp.makeConstraints { maker in
            maker.top.equalTo(7)
            maker.trailing.leading.equalToSuperview().inset(14)
            maker.bottom.equalTo(-7)
        }
    }
    
    private func attachTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(coverImageView.snp.top).offset(10)
            maker.trailing.leading.equalToSuperview().inset(25)
        }
    }
    
    private func attachDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).inset(-3)
            maker.trailing.leading.equalToSuperview().inset(25)
            maker.bottom.equalTo(-14)
        }
    }
        
    // MARK: - Configure viewModel
    
    func configure(
        with viewModel: SourcesNewsCellViewModel
    ) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.getTitle()
        descriptionLabel.text = viewModel.getDescription()
        
        guard let url = viewModel.getCoverImageURL() else { return }

        coverImageView.kf.set(
            resource: url
        )
    }
}

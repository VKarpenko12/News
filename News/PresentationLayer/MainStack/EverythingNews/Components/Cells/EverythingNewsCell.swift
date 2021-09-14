//
//  EverythingNewsCell.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

final class EverythingNewsCell: BaseNewsTableViewCell {
    
    // MARK: - Properties
    // MARK: Content

    var viewModel: EverythingNewsCellViewModel?
    
    // MARK: Views
    
    private(set) var titleLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = Color.white
        $0.font = Font.sfDisplayBold(size: 18)
    }
    
    // MARK: - Configuration 
    
    override func configure() {
        super.configure()
        
        attachTitleLabel()
    }
    
    private func attachTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(coverImageView.snp.bottom).offset(-10)
            maker.trailing.equalTo(-25)
            maker.leading.equalTo(25)
        }
    }
        
    // MARK: - Configure viewModel
    
    func configure(
        with viewModel: EverythingNewsCellViewModel
    ) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.getTitle()
        
        guard let url = viewModel.getCoverImageURL() else { return }

        coverImageView.kf.set(
            resource: url
        )
    }
}

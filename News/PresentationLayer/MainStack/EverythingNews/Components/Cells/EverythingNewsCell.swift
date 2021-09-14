//
//  EverythingNewsCell.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

final class EverythingNewsCell: BaseNewsTableViewCell {
    
    // MARK: - Properties
    
    var viewModel: EverythingNewsCellViewModel?
    
    // MARK: View
    
    
    // MARK: ConfigurationUI {
    
    override func configure() {
        super.configure()
        
    }
        
    // MARK: - Configure viewModel
    
    func configure(
        with viewModel: EverythingNewsCellViewModel
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

//
//  SourcesNewsCell.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

final class SourcesNewsCell: BaseNewsTableViewCell {
    
    // MARK: - Properties
    
    var viewModel: SourcesNewsCellViewModel?
    
    // MARK: - Configuration {
    
    override func configure() {
        super.configure()
        
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

//
//  NewsTableViewCell.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import UIKit
import SnapKit

final class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Content
    
    var viewModel: NewsCellViewModel?
    
    // MARK: Callbacks
    
    var didSelect: EmptyClosure?
    
    // MARK: Views
    
    private(set) var containerView = UIView().apply {
        $0.backgroundColor = .clear
    }
    
    private var coverImageView = UIImageView().apply {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
    }

    private var titleLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private var descriptionLabel = UILabel().apply {
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
    }

    // MARK: - Initialization
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        descriptionLabel.text = nil
        coverImageView.image = nil
    }
    
    // MARK: - Configuration
    
    private func configure() {
        backgroundColor = .clear
        
        attachContainerView()
        attachCoverImageView()
        attachTitleLabel()
        attachDescriptionLabel()
    }
    
    private func attachContainerView() {
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.height.greaterThanOrEqualTo(78)
        }
    }
    
    private func attachCoverImageView() {
        containerView.addSubview(coverImageView)
        
        coverImageView.snp.makeConstraints { maker in
            maker.leading.top.equalTo(14)
            maker.height.width.equalTo(50)
        }
    }
    
    private func attachTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(coverImageView.snp.top)
            maker.trailing.equalTo(-14)
            maker.leading.equalTo(coverImageView.snp.trailing).inset(-14)
        }
    }
    
    private func attachDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).inset(-3)
            maker.trailing.equalTo(-14)
            maker.leading.equalTo(coverImageView.snp.trailing).inset(-14)
            maker.bottom.equalTo(-14)
        }
    }
    
    // MARK: - Configure viewModel
    
    func configure(
        with viewModel: NewsCellViewModel
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

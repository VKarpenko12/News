//
//  BaseNewsTableViewCell.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import UIKit

class BaseNewsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Callbacks
    
    var didSelect: EmptyClosure?
    
    // MARK: Views
    
    private(set) var containerView = UIView().apply {
        $0.backgroundColor = Color.clear
    }
    
    private var coverView = UIView().apply {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Color.black.withAlphaComponent(0.5)
    }
    
    private(set) var coverImageView = UIImageView().apply {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = Color.systemLightGray
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
        
        coverImageView.image = nil
    }
    
    // MARK: - Configuration
    
    func configure() {
        backgroundColor = Color.clear
        
        attachContainerView()
    }
    
    private func attachContainerView() {
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.height.greaterThanOrEqualTo(78)
        }
        
        attachCoverImageView()
    }
    
    func attachCoverImageView() {
        containerView.addSubview(coverImageView)
        
        coverImageView.snp.makeConstraints { maker in
            maker.top.equalTo(7)
            maker.trailing.leading.equalToSuperview().inset(14)
            maker.height.equalTo(150)
            maker.bottom.equalTo(-7)
        }
        
        attachBackgrounView()
    }
    
    private func attachBackgrounView() {
        coverImageView.addSubview(coverView)
        
        coverView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

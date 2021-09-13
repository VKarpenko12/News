//
//  Kingfisher+Extension.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation
import Kingfisher

extension KingfisherWrapper where Base: UIImageView {
    
    // MARK: - Appearance
    
    @discardableResult
    func set(
        resource: Resource?,
        placeholder: Placeholder? = nil,
        options: KingfisherOptionsInfo = [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.5)),
            .cacheOriginalImage
        ],
        progress: DownloadProgressBlock? = nil,
        completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) -> DownloadTask? {
        setImage(
            with: resource,
            placeholder: placeholder,
            options: options,
            progressBlock: progress,
            completionHandler: completion
        )
    }
}

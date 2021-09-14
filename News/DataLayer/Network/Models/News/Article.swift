//
//  Articles.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import Foundation

protocol DisplayArticle {
    var title: String? { get }
    var description: String? { get }
    var urlToImage: String? { get }
    var content: String? { get }
}

extension DisplayArticle {
    var urlToImage: String? { nil }
}

struct Article: Decodable, DisplayArticle {
    
    // MARK: - Properties
    
    let author: String?
    var title: String?
    var description: String?
    let url: String?
    var urlToImage: String?
    let publishedAt: String?
    var content: String?
}

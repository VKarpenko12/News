//
//  SourceNew.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

struct SourceNews: Decodable {
    
    // MARK: - Properties
    
    let id: String?
    var name: String?
    var description: String?
    let url: String?
    var category: String?
    let language: String?
    var country: String?
}

extension SourceNews: DisplayArticle {
    var title: String? { name }
    var urlToImage: String? { nil }
    var content: String? { category }
}


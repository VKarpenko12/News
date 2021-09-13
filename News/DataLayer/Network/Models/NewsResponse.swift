//
//  NewsResponse.swift
//  News
//
//  Created by Vitalii Karpenko on 8/24/21.
//

import Foundation

struct NewsResponse: Decodable {
    
    // MARK: - Properties
    
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    
    // MARK: - Properties
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

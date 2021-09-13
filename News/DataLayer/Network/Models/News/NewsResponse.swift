//
//  NewsResponse.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import Foundation

struct NewsResponse: Decodable {
    
    // MARK: - Properties
    
    let status: String
    let totalResults: Int
    let articles: [Article]
}

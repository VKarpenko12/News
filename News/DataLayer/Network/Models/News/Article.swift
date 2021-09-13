//
//  Articles.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import Foundation

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

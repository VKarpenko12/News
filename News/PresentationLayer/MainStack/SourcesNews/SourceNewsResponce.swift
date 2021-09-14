//
//  SourceNewsResponce.swift
//  News
//
//  Created by Vitalii Karpenko on 9/14/21.
//

import Foundation

struct SourceNewsResponce: Decodable {
    
    // MARK: - Properties
    
    let status: String
    let sources: [SourceNews]
}

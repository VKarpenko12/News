//
//  NetworkService.swift
//  News
//
//  Created by Vitalii Karpenko on 8/24/21.
//

import Foundation

protocol NetworkDataFatcherProtocol {
    func request<T: Decodable>(api: NewsAPI, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkDataFatcherProtocol {
    func request<T: Decodable>(api: NewsAPI, completion: @escaping (Result<T, Error>) -> Void) {
        tappiProvider.request(api) { (result) in
            switch result {
            case .success(let response):
                do {
                    let model = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(model))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getArticles(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        request(api: .getNews, completion: completion)
    }
}

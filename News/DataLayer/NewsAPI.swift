//
//  NewsAPI.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import Foundation
import Moya

// MARK: - Provider setup

let tappiProvider = MoyaProvider<NewsAPI>(plugins: [NetworkLoggerPlugin()])

// MARK: - Provider support

enum NewsAPI {
    case getNews
}

fileprivate let mainURL = "https://newsapi.org"
fileprivate let apiKey = "9a9bb82235e34e5d981afffed29877bc"

extension NewsAPI: TargetType {
    var baseURL: URL { return URL(string: mainURL)! }
    var path: String {
        switch self {
            case .getNews:
                return "/v2/top-headlines"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            case .getNews:
                return .get
        }
    }
    
    private var parameters: [String: Any] {
        var parameters = [String: Any]()
        
        switch self {
            case .getNews:
            parameters["apikey"] = apiKey
            parameters["country"] = "us"
                
            return parameters
        }
    }
    
    private func sendTask<T: Codable>(object: T) -> Task {
        let data = try? JSONEncoder().encode(object)
        
        return .requestParameters(
            parameters: data?.dictionary() ?? [:],
            encoding: JSONEncoding.default
        )
    }
    
    private var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var task: Task {
        switch self {
            default:
                return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
            default:
                return nil
        }
    }
    
    private var validate: Bool {
        return true
    }
    
    var sampleData: Data {
        return "".data(using: .utf8) ?? Data()
    }
    
    func encodeFromObject<T>(_ object: T) -> Data? where T: Encodable {
        do {
            return try JSONEncoder().encode(object)
        }
        catch {
            return nil
        }
    }
}

fileprivate func url(_ route: TargetType) -> String {
    route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    fileprivate func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

extension Data {
    fileprivate func dictionary() -> [String: Any]? {
        guard let dict = try? JSONSerialization.jsonObject(
            with: self,
            options: []
        ) as? [String: Any] else {
            return nil
        }
        
        return dict
    }
}

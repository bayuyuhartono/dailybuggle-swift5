//
//  FetchService.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 01/03/25.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badURL, badResponse, badData
    }
    
    private let baseURL = URL(string: ProcessInfo.processInfo.environment["BASE_URL"] ?? "")!
    private let token = ProcessInfo.processInfo.environment["TOKEN"] ?? ""
    
    func fetchNews(topic: String?) async throws -> NewsModel {
        var newsURL = baseURL.appending(path: "/search")
            .appending(queryItems: [URLQueryItem(name: "engine", value: "google_news")])
            .appending(queryItems: [URLQueryItem(name: "gl", value: "us")])
            .appending(queryItems: [URLQueryItem(name: "hl", value: "en")])
            .appending(queryItems: [URLQueryItem(name: "api_key", value: token)])
        
        if (topic != nil) {
            newsURL = newsURL.appending(queryItems: [URLQueryItem(name: "topic_token", value: topic)])
        }
        
        var request = URLRequest(url: newsURL)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let news = try decoder.decode(NewsModel.self, from: data)
        
        return news
    }

}

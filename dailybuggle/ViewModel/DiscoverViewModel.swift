//
//  DiscoverViewModel.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 02/03/25.
//

import Foundation

@Observable
class DiscoverViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var discoverNews: [NewsResult] = []
    
    func getDiscoverData(for keyword: String) async {
        status = .fetching
        
        do {
            discoverNews = try await fetcher.fetchSearchNews(keyword: keyword).newsResults
            status = .successSearch
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
}

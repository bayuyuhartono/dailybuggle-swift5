//
//  SearchViewModel.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 02/03/25.
//

import Foundation

@Observable
class SearchViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var searchNews: [NewsResult] = []
    
    func getSearchData(for keyword: String) async {
        status = .fetching
        
        do {
            searchNews = try await fetcher.fetchSearchNews(keyword: keyword).newsResults
            status = .successSearch
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
}

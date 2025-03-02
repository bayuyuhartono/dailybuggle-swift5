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
    var isLoading: Bool = false
    
    func getSearchData(for keyword: String) async {
        status = .fetching
        isLoading = true
        
        do {
            searchNews = try await fetcher.fetchSearchNews(keyword: keyword).newsResults
            status = .successSearch
            isLoading = false
        } catch {
            print(error)
            status = .failed(error: error)
            isLoading = false
        }
    }
}

//
//  HomeViewModel.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import Foundation

@Observable
class HomeViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var sampleNews: NewsModel
    var newsData: [NewsResult] = []
    var topicData: [MenuLink] = []
    var topicPicked: String?
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let sampleData = try! Data(contentsOf: Bundle.main.url(forResource: "samplenews", withExtension: "json")!)
        sampleNews = try! decoder.decode(NewsModel.self, from: sampleData)
    }
    
    func getNewsData() async {
        status = .fetching
        
        do {
            let fetchData = try await fetcher.fetchNews(topic: topicPicked)
            newsData = fetchData.newsResults
            topicData = fetchData.menuLinks
            
            status = .successPopular
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
    
    func pickTopic(_ topic: String) async {
        topicPicked = topic
        await getNewsData()
    }

}

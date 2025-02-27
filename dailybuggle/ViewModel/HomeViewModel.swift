//
//  HomeViewModel.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import Foundation

@Observable
class HomeViewModel {
    var sampleNews: NewsModel
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let sampleData = try! Data(contentsOf: Bundle.main.url(forResource: "samplenews", withExtension: "json")!)
        sampleNews = try! decoder.decode(NewsModel.self, from: sampleData)
    }
}

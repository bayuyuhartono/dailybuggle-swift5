//
//  NewsList.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import SwiftUI

struct NewsList: View {
    let newsListData: [NewsResult]
    
    var body: some View {
        ScrollView {
            ForEach(newsListData) { list in
                NewsItem(item: list)
            }
        }
    }
}

#Preview {
    NewsList(newsListData: HomeViewModel().sampleNews.newsResults)
}

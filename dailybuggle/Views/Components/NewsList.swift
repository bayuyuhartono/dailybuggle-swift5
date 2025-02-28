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
            ForEach(0..<newsListData.count, id: \.self) { index in
                if index == 0 {
                    NewsItemCover(item: newsListData[index])
                } else {
                    NewsItem(item: newsListData[index])
                }
            }
        }
    }
}

#Preview {
    NewsList(newsListData: HomeViewModel().sampleNews.newsResults)
}

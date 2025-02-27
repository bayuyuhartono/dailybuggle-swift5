//
//  Category.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import SwiftUI

struct TopicList: View {
    let topicListData: [MenuLink]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(topicListData) { list in
                    TopicItem(item: list, isActive: false)
                }
            }
        }
    }
}

#Preview {
    TopicList(topicListData: HomeViewModel().sampleNews.menuLinks)
}

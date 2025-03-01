//
//  Category.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import SwiftUI

struct TopicList: View {
    let topicListData: [MenuLink]
    let topickPicked: String?
    let onClick: (_ topic: String) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(topicListData) { item in
                    TopicItem(item: item, isActive: topickPicked == item.topicToken, onClick: onClick)
                }
            }
        }
    }
}

#Preview {
    TopicList(
        topicListData: HomeViewModel().sampleNews.menuLinks,
        topickPicked: "CAAqJggKIiBDQkFTRWdvSUwyMHZNRGRqTVhZU0FtVnVHZ0pWVXlnQVAB",
        onClick: {topic in}
    )
}

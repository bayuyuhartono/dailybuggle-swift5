//
//  NewsLists.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import SwiftUI

struct NewsItem: View {
    let item: NewsResult
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.highlight!.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(item.highlight!.title)
                    .font(.headline)
                    .lineLimit(2)
                Text((item.highlight?.source.name)!)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}

#Preview {
    NewsItem(item: HomeViewModel().sampleNews.newsResults[0])
}

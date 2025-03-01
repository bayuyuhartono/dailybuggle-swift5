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
            AsyncImage(url: URL(string: (item.highlight?.thumbnail ?? item.thumbnail) ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipped()
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.highlight?.title ?? item.title ?? "")
                    .font(.headline)
                    .lineLimit(2)
                Text(item.highlight?.source?.name ?? item.source?.name ?? "")
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

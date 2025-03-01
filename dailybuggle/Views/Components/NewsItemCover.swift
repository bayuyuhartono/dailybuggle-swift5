//
//  NewsItemFirst.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 28/02/25.
//

import SwiftUI

struct NewsItemCover: View {
    let item: NewsResult
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: item.highlight?.thumbnail ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
            .scaledToFill()
            .frame(height: 220)
            .clipped()
            .background(.ultraThinMaterial)
            .shadow(radius: 20)
            .cornerRadius(8.0)
            
            VStack(alignment: .leading) {
                Text(item.highlight?.source?.name ?? "")
                    .font(.subheadline)
                    .lineLimit(1)

                Text(item.highlight?.title ?? "")
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundStyle(.uiBlack)
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    NewsItemCover(item: HomeViewModel().sampleNews.newsResults[0])
}

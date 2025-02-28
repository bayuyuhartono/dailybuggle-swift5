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
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: item.highlight?.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text((item.highlight?.source.name)!)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                }
                .shadow(radius: 9)

                Text(item.highlight?.title ?? "")
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .scaledToFill()
        .frame(height: 220)
        .background(.ultraThinMaterial)
        .shadow(radius: 20)
        .cornerRadius(8.0)
    }
}

#Preview {
    NewsItemCover(item: HomeViewModel().sampleNews.newsResults[0])
}

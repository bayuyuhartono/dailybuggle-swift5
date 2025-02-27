//
//  HomeView.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 26/02/25.
//

import SwiftUI

struct HomeView: View {
    let homeVm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TopicList(topicListData: homeVm.sampleNews.menuLinks)
                Spacer(minLength: 16)
                NewsList(newsListData: homeVm.sampleNews.newsResults)
            }
            .padding(.top, 16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Daily Buggle")
                        .font(.title)
                        .foregroundStyle(.uiBlack)
                        .fontWeight(.bold)
                        .padding(8)
                }
            }
            .background(.white)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    HomeView()
}

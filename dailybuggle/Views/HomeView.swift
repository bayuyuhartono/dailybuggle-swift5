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
                TopicList(
                    topicListData: homeVm.topicData,
                    topickPicked: homeVm.topicPicked,
                    onClick: { topic in
                        Task {
                            await homeVm.pickTopic(topic)
                        }
                    }
                )
                Spacer(minLength: 16)
                NewsList(newsListData: homeVm.newsData)
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
        .task {
            await homeVm.getNewsData()
        }
    }
}

#Preview {
    HomeView()
}

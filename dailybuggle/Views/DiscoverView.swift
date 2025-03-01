//
//  DiscoverView.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 02/03/25.
//

import SwiftUI

struct DiscoverView: View {
    @State var discoverText = ""

    let discoverVm = DiscoverViewModel()
    
    let debouncer = Debouncer(delay: 0.5)
    
    func search(query: String) async {
        await discoverVm.getDiscoverData(for: query)
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                if discoverVm.discoverNews.count > 0 {
                    VStack {
                        ForEach(discoverVm.discoverNews) { item in
                            NewsItem(item: item)
                        }
                    }
                } else {
                    Text("Please enter your search text")
                        .foregroundStyle(.uiGrey)
                        .padding(.vertical, 32)
                }
            }
            .padding(16)
        }
        .ignoresSafeArea()
        .searchable(text: $discoverText)
        .onChange(of: discoverText) { oldValue, newValue in
            debouncer.debounce {
                Task{
                    await search(query: newValue)
                }
            }
        }
    }
}

#Preview {
    DiscoverView()
}

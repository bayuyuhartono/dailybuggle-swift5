//
//  SearchView.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 02/03/25.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""

    let searchVm = SearchViewModel()
    
    let debouncer = Debouncer(delay: 0.5)
    
    func search(query: String) async {
        await searchVm.getSearchData(for: query)
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                if searchVm.searchNews.count > 0 {
                    VStack {
                        ForEach(searchVm.searchNews) { item in
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
        .searchable(text: $searchText)
        .onChange(of: searchText) { oldValue, newValue in
            debouncer.debounce {
                Task{
                    await search(query: newValue)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}

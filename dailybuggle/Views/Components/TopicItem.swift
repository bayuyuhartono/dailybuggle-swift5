//
//  CategoryBadge.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import SwiftUI

struct TopicItem: View {
    let item: MenuLink
    let isActive: Bool
    
    var body: some View {
        HStack() {
            Text(item.title)
                .foregroundStyle(isActive ? .white : .uiGrey)
                .font(.caption2)
                .fontWeight(.bold)
        }
        .padding(8)
        .background(isActive ? .uiBlack : .uiSmoke)
        .cornerRadius(15)
        .padding([.leading, .top], 4)
    }
}

#Preview {
    TopicItem(item: HomeViewModel().sampleNews.menuLinks[0], isActive: false)
}

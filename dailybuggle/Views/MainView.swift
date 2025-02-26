//
//  ContentView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                HomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                HomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
            }

            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(8)
            }
            .frame(height: 60)
            .cornerRadius(40)
            .padding(.horizontal, 32)
        }
        .padding(.bottom, 16)
        .ignoresSafeArea()
    }
}

extension MainView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .uiSmoke : .uiGrey)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .white : .uiGrey)
            }
            Spacer()
        }
        .frame(width: isActive ? 170 : 60, height: 50)
        .background(isActive ? .uiGreen : .clear)
        .cornerRadius(40)
    }
}

#Preview {
    MainView()
}

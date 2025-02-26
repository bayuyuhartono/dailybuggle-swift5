//
//  HomeView.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 26/02/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! Home")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}

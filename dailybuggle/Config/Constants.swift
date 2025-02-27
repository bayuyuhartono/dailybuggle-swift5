//
//  Constants.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 26/02/25.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case bookmark
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .bookmark:
            return "Discover"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "newspaper"
        case .bookmark:
            return "globe.americas.fill"
        case .profile:
            return "person.circle"
        }
    }
}

enum FetchStatus {
    case notStarted
    case fetching
    case successPopular
    case successNowPlaying
    case successTopRated
    case successSearch
    case successDetail
    case failed(error: Error)
}

//
//  NewsModel.swift
//  dailybuggle
//
//  Created by Bayu Yuhartono on 27/02/25.
//

import Foundation

// MARK: - News
struct NewsModel: Decodable {
    let searchMetadata: SearchMetadata
    let searchParameters: SearchParameters
    let title: String?
    let newsResults: [NewsResult]
    let menuLinks: [MenuLink]
    let subMenuLinks: [MenuLink]?

    enum CodingKeys: String, CodingKey {
        case searchMetadata
        case searchParameters
        case title
        case newsResults
        case menuLinks
        case subMenuLinks
    }
}

// MARK: - MenuLink
struct MenuLink: Decodable, Identifiable {
    let title, topicToken: String
    let serpapiLink: String
    let sectionToken: String?
    
    var id: String {
        return topicToken
    }

    enum CodingKeys: String, CodingKey {
        case title
        case topicToken
        case serpapiLink
        case sectionToken
    }
}

// MARK: - NewsResult
struct NewsResult: Decodable, Identifiable {
    let position: Int
    let highlight: Highlight?
    let stories: [Story]?
    let storyToken: String?
    let serpapiLink: String?
    let title: String?
    let source: Source?
    let link: String?
    let thumbnail: String?
    let thumbnailSmall: String?
    let date: String?
    
    var id: Int {
        return position
    }

    enum CodingKeys: String, CodingKey {
        case position, highlight, stories
        case storyToken
        case serpapiLink
        case title, source, link, thumbnail
        case thumbnailSmall
        case date
    }
}

// MARK: - Highlight
struct Highlight: Decodable {
    let title: String
    let source: Source?
    let link: String
    let thumbnail: String?
    let thumbnailSmall: String?
    let date: String

    enum CodingKeys: String, CodingKey {
        case title, source, link, thumbnail
        case thumbnailSmall
        case date
    }
}

// MARK: - Source
struct Source: Decodable {
    let name: String
    let icon: String
    let authors: [String]?
}

// MARK: - Story
struct Story: Decodable {
    let position: Int
    let title: String
    let source: Source
    let link: String
    let thumbnail: String?
    let thumbnailSmall: String?
    let storyToken: String
    let serpapiLink: String
    let date: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case position, title, source, link, thumbnail
        case thumbnailSmall
        case storyToken
        case serpapiLink
        case date, type
    }
}

// MARK: - SearchMetadata
struct SearchMetadata: Decodable {
    let id, status: String
    let jsonEndpoint: String
    let createdAt, processedAt: String
    let googleNewsURL: String?
    let rawHTMLFile: String?
    let totalTimeTaken: Double

    enum CodingKeys: String, CodingKey {
        case id, status
        case jsonEndpoint
        case createdAt
        case processedAt
        case googleNewsURL
        case rawHTMLFile
        case totalTimeTaken
    }
}

// MARK: - SearchParameters
struct SearchParameters: Decodable {
    let engine, gl, hl: String
    let topicToken: String?

    enum CodingKeys: String, CodingKey {
        case engine, gl, hl
        case topicToken
    }
}

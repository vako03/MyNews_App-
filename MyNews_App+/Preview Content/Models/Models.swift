//
//  Models.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let id: UUID
    let title: String
    let description: String?
    let urlToImage: String?
    let author: String?
    let publishedAt: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID() 
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    init(id: UUID = UUID(), title: String, description: String?, urlToImage: String?, author: String?, publishedAt: String, url: String) {
        self.id = id
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.author = author
        self.publishedAt = publishedAt
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case author
        case publishedAt
        case url
    }
}

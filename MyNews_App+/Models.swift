//
//  Models.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let urlToImage: String?
    let author: String?
    let publishedAt: String
    let url: String
}

//
//  NewsViewModel.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []

    func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=9c163e5edef146b497b38054c6f0cfcd") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching news data: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data fetched")
                return
            }

            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles = newsResponse.articles
                }
            } catch {
                print("Error decoding news data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

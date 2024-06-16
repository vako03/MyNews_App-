//
//  ContentView.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var newsViewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
            List(newsViewModel.articles) { article in
                NavigationLink(destination: DetailsView(article: article)) {
                    NewsCell(article: article)
                }
            }
            .navigationTitle("ყვითელი პრესა")
        }
        .onAppear {
            newsViewModel.fetchNews()
        }
    }
}

struct NewsCell: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RemoteImage(urlString: article.urlToImage)
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)

            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

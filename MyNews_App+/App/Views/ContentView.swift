//
//  ContentView.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject private var newsViewModel = NewsViewModel()
    @State private var selectedArticle: Article? = nil
    
    var body: some View {
        NavigationStack {
            List(newsViewModel.articles) { article in
                NavigationLink(destination: DetailsView(article: article)) {
                    NewsCell(article: article)
                }
            }
            .navigationTitle("ყვითელი პრესა")
            .onAppear {
                newsViewModel.fetchNews()
            }
        }
        .sheet(item: $selectedArticle) { article in
            DetailsView(article: article)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  DetailsView.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//
import SwiftUI

struct DetailsView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                RemoteImage(urlString: article.urlToImage)
                    .scaledToFit()
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    .padding()
                
                Text(article.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
                
                Text("Author: \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                if let formattedDate = formatDate(article.publishedAt) {
                    Text("Published at: \(formattedDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
    
    func formatDate(_ dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(article: Article(id: UUID(), title: "Sample Article", description: "Sample description", urlToImage: nil, author: "John Doe", publishedAt: "2023-01-01T12:00:00Z", url: "https://example.com"))
    }
}

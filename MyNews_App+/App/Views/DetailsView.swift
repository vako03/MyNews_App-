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
                    .accessibility(label: Text("Title: \(article.title)"))
                
                Text(article.description ?? "No description available.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    .accessibility(label: Text("Description: \(article.description ?? "No description available.")"))
                
                Text("Author: \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .accessibility(label: Text("Author: \(article.author ?? "Unknown")"))
                
                Text("Published at: \(formatDate(article.publishedAt))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .accessibility(label: Text("Published at: \(formatDate(article.publishedAt))"))
                
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
    
    func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        } else {
            return "Date Unknown"
        }
    }
}

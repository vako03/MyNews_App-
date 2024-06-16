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

                Text(article.description ?? "No description available.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.horizontal)

                Text("Author: \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text("Published at: \(formatDate(article.publishedAt))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
            .background(Color.white) // Set background color
            .cornerRadius(12) // Optionally, round the corners
            .shadow(radius: 5) // Add shadow
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white) // Ensure background color extends beyond scroll view
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

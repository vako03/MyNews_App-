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
        VStack(alignment: .leading, spacing: 16) {
            RemoteImage(urlString: article.urlToImage)
                .scaledToFit()
                .cornerRadius(8)
                .padding()

            Text(article.title)
                .font(.title)
                .bold()
                .padding(.horizontal)

            Text(article.description ?? "No description available.")
                .font(.body)
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(article.title)
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(article: Article(
            title: "Sample Article",
            description: "Sample Description",
            urlToImage: nil,
            author: "John Doe",
            publishedAt: "2023-01-01T12:00:00Z",
            url: "https://sampleurl.com"
        ))
    }
}

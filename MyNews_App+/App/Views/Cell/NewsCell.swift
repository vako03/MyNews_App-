//
//  NewsCell.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 17.06.24.
//

import SwiftUI

struct NewsCell: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RemoteImage(urlString: article.urlToImage)
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)
                .accessibility(hidden: true)
            
            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)
                .accessibility(label: Text("Title: \(article.title)"))
                .accessibility(hint: Text("Double tap to view details"))
                .accessibility(addTraits: .isButton)
                .padding(.top, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .accessibilityElement(children: .combine)
    }
}

//
//  NewsCell.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 17.06.24.
//

import Foundation
import SwiftUI

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

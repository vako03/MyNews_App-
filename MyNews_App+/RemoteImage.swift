//
//  RemoteImage.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//

import SwiftUI

struct RemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String?

    var body: some View {
        if let uiImage = imageLoader.image {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Color.gray
                .frame(width: 200, height: 200)
                .onAppear {
                    if let urlString = urlString, let url = URL(string: urlString) {
                        imageLoader.loadImage(url: url)
                    }
                }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil

    func loadImage(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

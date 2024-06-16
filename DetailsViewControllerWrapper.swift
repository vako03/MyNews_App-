//
//  DetailsViewControllerWrapper.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 16.06.24.
//
import SwiftUI

struct DetailsViewControllerWrapper: UIViewControllerRepresentable {
    let article: Article

    func makeUIViewController(context: Context) -> UINavigationController {
        let detailsVC = DetailsViewController()
        detailsVC.article = article
        let navController = UINavigationController(rootViewController: detailsVC)
        return navController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update code if needed
    }
}

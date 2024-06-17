//
//  UITableViewWrapper.swift
//  MyNews_App+
//
//  Created by valeri mekhashishvili on 17.06.24.
//

import SwiftUI

struct UITableViewWrapper: UIViewRepresentable {
    let data: [Article]
    let didSelectItem: (Article) -> Void
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        // Update the UITableView if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data, didSelectItem: didSelectItem)
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        let data: [Article]
        let didSelectItem: (Article) -> Void
        
        init(data: [Article], didSelectItem: @escaping (Article) -> Void) {
            self.data = data
            self.didSelectItem = didSelectItem
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let article = data[indexPath.row]
            cell.textLabel?.text = article.title
            cell.accessibilityLabel = article.title
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let article = data[indexPath.row]
            didSelectItem(article)
        }
    }
}

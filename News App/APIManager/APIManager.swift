//
//  APIManager.swift
//  News App
//
//  Created by Ірина Зеліско on 19.04.2023.
//

import Foundation
import RealmSwift


struct NewsResponce: Codable {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct Source: Codable {
    let id: String
    let name: String
}

class APIManager {
    func fetchNews() {
        if  let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=41ce3b8fd999490a8f6766af77686f62") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let newsResponce = try jsonDecoder.decode(NewsResponce.self, from: data)
                    
                    let newsObject = NewsObject()
                    newsObject.title = newsResponce.title
                    newsObject.author = newsResponce.author
                    newsObject.source = newsResponce.source.name
                    newsObject.id = UUID().uuidString
                    newsObject.imageCellView = newsResponce.urlToImage
                    
                    let realm = try Realm()
                    try realm.write {
                        realm.add(newsObject, update: .modified)
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
            task.resume()
        }
    }
}


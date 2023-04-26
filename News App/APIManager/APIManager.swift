//
//  APIManager.swift
//  News App
//
//  Created by Ірина Зеліско on 19.04.2023.
//

import Foundation
import RealmSwift


struct Responce: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsResponce]
}

struct NewsResponce: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}

class APIManager {
    func fetchNews() {
        if  let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=41ce3b8fd999490a8f6766af77686f62") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let newsResponce = try jsonDecoder.decode(Responce.self, from: data)
                    
                    for article in newsResponce.articles {
                        let newsObject = NewsObject()
                        
                        newsObject.title = article.title
                        newsObject.author = article.author
                        newsObject.source = article.source?.name
                        newsObject.id = UUID().uuidString
                        newsObject.imageCellView = article.urlToImage
                        
                        let realm = try Realm()
                        try realm.write {
                            realm.add(newsObject)
                        }
                    }
                } catch {
                    print(String(describing: error))
                }
            }
            task.resume()
        }
    }
}


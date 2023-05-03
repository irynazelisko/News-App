//
//  APIManager.swift
//  News App
//
//  Created by Ірина Зеліско on 19.04.2023.
//

import Foundation
import RealmSwift
import MBProgressHUD


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

final class APIManager {
    func fetchNews(completion: @escaping ((Bool, String?) -> Void)) {
        if  let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=41ce3b8fd999490a8f6766af77686f62") {
            let request = URLRequest(url: url)
            
            DispatchQueue.main.async {
                if let window = UIApplication.shared.windows.first {
                    MBProgressHUD.showAdded(to: window, animated: true)
                }
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let window = UIApplication.shared.windows.first {
                        MBProgressHUD.hide(for: window, animated: true)
                    }
                }
                
                guard let data = data else {
                    completion(false, "Server error")
                    return }
                
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
                    completion(true, nil)
                } catch {
                    completion(false, String(describing: error))
                }
            }
            task.resume()
        }
    }
}


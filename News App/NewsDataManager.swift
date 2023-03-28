//
//  RealmManager.swift
//  News App
//
//  Created by Ірина Зеліско on 27.03.2023.
//

import Foundation
import RealmSwift

protocol NewsDataManagerProtocol {
    func save(newsArray: [NewsCell])
    func getNews() -> Results<NewsObject>
}

class NewsDataManager: NewsDataManagerProtocol  {
    
    static let shared = NewsDataManager()
    let realm = try! Realm()
    
    func save(newsArray: [NewsCell]) {
        try! realm.write {
            let newsObject = NewsObject()
            realm.add(newsObject)
        }
    }
    func getNews() -> Results<NewsObject> {
        return realm.objects(NewsObject.self)
    }
}


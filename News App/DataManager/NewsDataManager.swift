//
//  RealmManager.swift
//  News App
//
//  Created by Ірина Зеліско on 27.03.2023.
//

import Foundation
import RealmSwift

protocol NewsDataManagerProtocol {
    func save(news: NewsObject)
    func getNews() -> Results<NewsObject>
    func delete(news: NewsObject)
    func setFavoriteValue(id: String, value: Bool) // TODO: add func for setup favorite/unfavorite value for object
}

final class NewsDataManager: NewsDataManagerProtocol  {
    
    let realm = try! Realm()
    
    func save(news: NewsObject) {
        try! realm.write {
            realm.add(news, update: .modified)
        }
        print("Added to database")
    }
    
    func delete(news: NewsObject){
        try! realm.write {
            realm.delete(news)
        }
        print("Deleted from database")
    }
    
    func getNews() -> Results<NewsObject> {
        let objects =  realm.objects(NewsObject.self)
//        print(objects)
        return objects
    }
    
    func setFavoriteValue(id: String, value: Bool) {
        for object in getNews() {
            if object.id == id {
                try! realm.write {
                object.isFavorite = value
                
            }
                save(news: object)
            }
        }
    }
}


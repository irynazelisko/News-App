//
//  NewsViewViewModel.swift
//  News App
//
//  Created by Ірина Зеліско on 17.03.2023.
//

import Foundation
import RealmSwift

protocol NewsViewPresentationModel {
    var  newsCells: [TableCellViewModel] { get }
    func addToFavorites(with id: String)
    func removeFromFavorites(with id: String)
    var favoriteNewsArray: [String] { get }
    var favoritesCallback: ((Bool) -> ())? { get set }
}

let newsDataManager = NewsDataManager()
let apiManager = APIManager()

final class NewsViewViewModel: NewsViewPresentationModel {
    var favoritesCallback: ((Bool) -> ())?

    let realm = try! Realm()
    
    var favoriteNewsArray: [String] {
        newsDataManager.getNews().filter({$0.isFavorite}).compactMap({$0.id})
    }
    
    var newsCells: [TableCellViewModel] = newsDataManager.getNews().map{ TableCellViewModel(news: $0) }
    

    func addToFavorites(with id: String) {
        newsDataManager.setFavoriteValue(id: id, value: true)
        newsCells = newsDataManager.getNews().map{ TableCellViewModel(news: $0) }
        favoritesCallback?(true)
    }
    
    func removeFromFavorites(with id: String) {
        newsDataManager.setFavoriteValue(id: id, value: false)
        newsCells = newsDataManager.getNews().map{ TableCellViewModel(news: $0) }
       favoritesCallback?(false)
    }

    func fetchData() {
        let realm = try! Realm()
        let oldNews = realm.objects(NewsObject.self)
        try! realm.write {
            realm.delete(oldNews)
        }
        apiManager.fetchNews()
    }
}


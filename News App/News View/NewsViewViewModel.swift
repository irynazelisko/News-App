//
//  NewsViewViewModel.swift
//  News App
//
//  Created by Ірина Зеліско on 17.03.2023.
//

import Foundation

protocol NewsViewPresentationModel {
    var  newsCells: [TableCellViewModel] { get }
    func favoriteIcon(id: String) -> String
    func addToFavorites(with id: String)
    func removeFromFavorites(with id: String)
}

let newsDataManager = NewsDataManager()

final class NewsViewViewModel: NewsViewPresentationModel {
    
    func favoriteIcon(id: String) -> String {
        if favoriteNewsArray.contains(id){
            return "heart.fill"
        }
        return "heart"
    }
    
    var newsCells: [TableCellViewModel] = newsDataManager.getNews().map{ TableCellViewModel(news: $0) } // TODO: 1. load object from DataManager
    
    var favoriteNewsArray: [String] = []
    
    func addToFavorites(with id: String) {
        favoriteNewsArray.append(id)
        newsDataManager.setFavoriteValue(id: id, value: true)
        // TODO: modify object with id in database as favorite
    }
    
    func removeFromFavorites(with id: String) {
        if let index = favoriteNewsArray.firstIndex(of: id) {
            favoriteNewsArray.remove(at: index)
            newsDataManager.setFavoriteValue(id: id, value: false)
            // TODO: modify object with id in database as unfavorite
        }
    } 
}

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
    func favoriteIcon(id: String) -> String
    func addToFavorites(with id: String)
    func removeFromFavorites(with id: String)
}

final class NewsViewViewModel: NewsViewPresentationModel {
    
//    let realm = try! Realm()
    
    func favoriteIcon(id: String) -> String {
        if favoriteNewsArray.contains(id){
            return "heart.fill"
        }
        return "heart"
    }
    
    var newsCells: [TableCellViewModel] = NewsDataSourceMock.newsArray.map{ TableCellViewModel(news: $0) }
    
    var favoriteNewsArray: [String] = [] 
       
    
    func addToFavorites(with id: String) {
        favoriteNewsArray.append(id)
    }
    
    func removeFromFavorites(with id: String) {
        if let index = favoriteNewsArray.firstIndex(of: id) {
            favoriteNewsArray.remove(at: index)
        }
    }
  
    
    
}

//
//  TableCellViewModel.swift
//  News App
//
//  Created by Ірина Зеліско on 01.03.2023.
//

import UIKit
import RealmSwift
protocol TableCellPresentationModel {
    var author: String { get }
    var title: String { get }
    var source: String { get }
    var imageCellView: String { get }
    var id: String { get }
    var isFavorite: Bool { get }
    func loadImage(completion: @escaping (UIImage?) -> Void)
}

final class TableCellViewModel: TableCellPresentationModel {

    let author: String
    let title: String
    let source: String
    let imageCellView: String
    let id: String
    var isFavorite: Bool
    
    
    init(news: NewsCell){
        self.author = news.author
        self.title = news.title
        self.source = news.source
        self.imageCellView = news.imageCellView
        self.id = news.id
        self.isFavorite = news.isFavorite
    }
    
    // TODO:  1. add new init
    init(news: NewsObject) {
        guard let author = news.author,
              let title = news.title,
              let source = news.source,
              let imageCellView = news.imageCellView,
              let id = news.id else { fatalError() }
        self.author = author
        self.title = title
        self.source = source
        self.imageCellView = imageCellView
        self.id = id
        self.isFavorite = news.isFavorite
    }
    
    func favoriteIcon() -> String {
        self.isFavorite ? "heart.fill": "heart"
    }
    
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: imageCellView) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let imageData = data {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
    
}



//
//  NewsCell.swift
//  News App
//
//  Created by Ірина Зеліско on 17.03.2023.
//

import Foundation
import RealmSwift

class NewsObject: Object {
    @objc dynamic var title: String?// objc dynamic - дозволяє змінювати значення властивостей в реальному часі
    @objc dynamic var author: String?
    @objc dynamic var source: String?
    @objc dynamic var imageCellView: String?
    @objc dynamic var id: String?

    override static func primaryKey() -> String? { // кажемо, що кожен об'єкт у базі даних буде унікальним за значенням його id
        return "id"
    }
}

struct NewsCell {
    let title: String
    let author: String
    let source: String
    let imageCellView: String
    let id: String
}

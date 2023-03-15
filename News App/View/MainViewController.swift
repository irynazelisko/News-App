//
//  ViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 20.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var cellViewModel = TableCellViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
        let article = cellViewModel.newsArray[indexPath.row]
        
        guard let articleCell = cell as? NewsTableViewCell else {
            return cell
        }
        
        cellViewModel.registerCell(articleCell, with: article)
        
        return articleCell
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let article = cellViewModel.newsArray[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        
        
        // Створюємо favorite action
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completion) in
            self.cellViewModel.addToFavorites(with: article.id, for: cell.favoriteButton)
            print("Added to favorites")
            completion(true)
        }
        favoriteAction.backgroundColor = .lightGray
        
        
        // Створюємо unfavorite action
        let unfavoriteAction = UIContextualAction(style: .destructive, title: "Unfavorite") { (action, view, completion) in
            self.cellViewModel.removeFromFavorites(with: article.id, for: cell.favoriteButton)
            print("Removed from favorites")
            completion(true)
        }
        
        
        // Дії які виконуються під час проведення пальцем по рядках таблиці
        let configuration = UISwipeActionsConfiguration(actions: [unfavoriteAction, favoriteAction])
        return configuration
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newCell = cellViewModel.newsArray[indexPath.row]
        let urlToImage = newCell.urlToImage
        
        let webViewController = WebViewController(urlString: urlToImage)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    
}

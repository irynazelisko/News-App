//
//  ViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 20.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var tableViewModel = NewsViewViewModel()
    
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
        return tableViewModel.newsCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
        let article = tableViewModel.newsCells[indexPath.row]
        
        guard let articleCell = cell as? NewsTableViewCell else {
            return cell
        }
        
        articleCell.setUpData(viewModel: article)
        
        return articleCell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let article = tableViewModel.newsCells[indexPath.row]
        
        // Створюємо favorite action
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { [weak self] (action, view, completion) in
            self?.tableViewModel.addToFavorites(with: article.id)
            if let icon = self?.tableViewModel.favoriteIcon(id: article.id) {
                if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
                    cell.upDateFavoriteButton(icon: icon)
                }
                print("Added to favorites")
            }
            completion(true)
        }
        favoriteAction.backgroundColor = .lightGray
        
        
        // Створюємо unfavorite action
        let unfavoriteAction = UIContextualAction(style: .destructive, title: "Unfavorite") { [weak self] (action, view, completion) in
            self?.tableViewModel.removeFromFavorites(with: article.id)
            if let icon = self?.tableViewModel.favoriteIcon(id: article.id) {
                if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
                    cell.upDateFavoriteButton(icon: icon)
                }
                print("Removed from favorites")
            }
            completion(true)
        }
        
        
        // Дії які виконуються під час проведення пальцем по рядках таблиці
        let configuration = UISwipeActionsConfiguration(actions: [unfavoriteAction, favoriteAction])
        return configuration
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newCell = tableViewModel.newsCells[indexPath.row]
        let urlToImage = newCell.imageCellView
        
        let webViewController = WebViewController(urlString: urlToImage)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
}

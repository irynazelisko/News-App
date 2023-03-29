//
//  ViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 20.02.2023.
//

import UIKit
import RealmSwift

final class MainViewController: UIViewController {
    
    var tableViewModel = NewsViewViewModel()
    let favoritiesViewModel = FavoritiesViewModel()
    let refreshControl = UIRefreshControl()
    var realmDB: Realm!
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        setUp()
        // cтворюємо об'єкт UIRefreshControl для оновлення вмісту таблиці та додаємо до таблички
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        realmDB = try! Realm()
        print(realmDB.configuration.fileURL!)
        
    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing() // зупиняємо процес оновлення
    }
    
    
    func setUp(){
        let favoritesButton = UIBarButtonItem(image: UIImage(systemName: "heart.text.square"), style: .plain, target: self,action: #selector(showFavorites))
        navigationItem.rightBarButtonItem = favoritesButton
        navigationItem.rightBarButtonItem?.tintColor = .systemPink
    }
    
    @objc func showFavorites() {
        performSegue(withIdentifier: "showFavorites", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFavorites" {
            let favoritesViewController = segue.destination as! FavoritiesViewController
            favoritesViewController.favoritiesViewModel.favoritesList = tableViewModel.favoriteNewsArray
            
        }
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
        let icon = tableViewModel.favoriteIcon(id: article.id)
        articleCell.upDateFavoriteButton(icon: icon)
        
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
            let newsObject = NewsObject()
            newsObject.title = article.title
            newsObject.author = article.author
            newsObject.source = article.source
            newsObject.imageCellView = article.imageCellView
            newsObject.id = article.id
            let newsDataManager = NewsDataManager()
            newsDataManager.save(news: newsObject) // зберігаємо обʼєкт в базі даних
   
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
    
           
            let dataManager = NewsDataManager()
            let newsObjects = dataManager.getNews()
            if let newsObject = newsObjects.first(where: { $0.id == article.id }) {
                dataManager.delete(news: newsObject)
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

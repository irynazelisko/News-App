//
//  FavoritiesViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 22.03.2023.
//

import UIKit

final class FavoritiesViewController: UIViewController {
    
    let favoritiesViewModel = FavoritiesViewModel()
    let viewModel = NewsViewViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.reloadData()
    }
}

extension FavoritiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritiesViewModel.favoritesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
        let articleId = favoritiesViewModel.favoritesList[indexPath.row]
        let article = viewModel.newsCells.first(where: { $0.id == articleId })
        
        guard let articleCell = cell as? NewsTableViewCell, let article = article else {
            return cell
        }
        
        articleCell.setUpData(viewModel: article)
        
        return articleCell
    }
}


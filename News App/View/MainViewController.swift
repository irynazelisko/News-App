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
        
        guard let articleCell = cell as? NewsTableViewCell else {
            return cell
        }
        let article = cellViewModel.newsArray[indexPath.row]
        
        articleCell.title.text = article.title
        articleCell.author.text = article.author
        articleCell.source.text = article.source
        
        if let url = URL(string: article.urlToImage) {
            cellViewModel.loadImage(from: url) { image in
                DispatchQueue.main.async {
                    articleCell.urlToImage.image = image
                }
            }
        }
    
        return articleCell
    
    }
   
}

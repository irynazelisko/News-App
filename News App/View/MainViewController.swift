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
        cellViewModel.registerCell(articleCell, with: article)
        
        return articleCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newCell = cellViewModel.newsArray[indexPath.row]
        let urlToImage = newCell.urlToImage
        
        let webViewController = WebViewController(urlString: urlToImage)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    
}

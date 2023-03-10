//
//  NewsTableViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 01.03.2023.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
//    var cellViewModel = TableCellViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
    }
    
}
// MARK: - Table view data source, delegate

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
//
//    guard let articleCell = cell as? NewsTableViewCell else {
//        return cell
//    }
//
//    return articleCell
    return cell
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
}



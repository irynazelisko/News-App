//
//  NewsTableViewCell.swift
//  News App
//
//  Created by Ірина Зеліско on 01.03.2023.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak  var urlToImage: UIImageView!
    @IBOutlet weak  var title: UILabel!
    @IBOutlet weak  var author: UILabel!
    @IBOutlet weak  var source: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func prepareForReuse() {
        urlToImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

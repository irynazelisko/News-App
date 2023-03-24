//
//  NewsTableViewCell.swift
//  News App
//
//  Created by Ірина Зеліско on 01.03.2023.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak  var imageCellView: UIImageView!
    @IBOutlet weak  var title: UILabel!
    @IBOutlet weak  var author: UILabel!
    @IBOutlet weak  var source: UILabel!
    @IBOutlet weak  var favoriteButton: UIButton!
    
    var viewModel: TableCellViewModel? {
        didSet{
            initData()
        }
    }
    
    override func prepareForReuse() {
        imageCellView.image = nil
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func upDateFavoriteButton(icon: String) {
        favoriteButton.setImage(UIImage(systemName: icon), for: .normal)
    }
    
    func setUpData(viewModel: TableCellViewModel) {
        self.viewModel = viewModel
        
    }
    
    private func initData() {
        title.text = viewModel?.title
        author.text = viewModel?.author
        source.text = viewModel?.source
        
        viewModel?.loadImage { [weak self] image in
            self?.imageCellView.image = image
        }
    }
    
}

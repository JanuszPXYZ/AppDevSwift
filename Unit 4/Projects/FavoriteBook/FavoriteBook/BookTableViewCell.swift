//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Janusz Polowczyk on 19/10/2020.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        titleLabel.text = "Title: \(book.title)"
        authorLabel.text = "Author: \(book.author)"
        genreLabel.text = "Genre: \(book.genre)"
        lengthLabel.text = "Length: \(book.length)"
    }

}

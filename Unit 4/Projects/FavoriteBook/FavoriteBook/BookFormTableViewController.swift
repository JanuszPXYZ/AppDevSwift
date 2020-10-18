//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Janusz Polowczyk on 18/10/2020.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView() {
        guard let book = book else { return }
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "saveBook", sender: self)
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        
//        guard segue.identifier == "saveBook" else { return }
//         
//        let title = titleTextField.text ?? ""
//        let author = authorTextField.text ?? ""
//        let genre = genreTextField.text ?? ""
//        let length = lengthTextField.text ?? ""
//        
//        book = Book(title: title, author: author, genre: genre, length: length)
//    }
//    

}

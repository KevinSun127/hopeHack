//
//  WorkoutView.swift
//  HackforHope
//
//  Created by Kevin Sun on 4/17/20.
//  Copyright © 2020 Kevin Sun. All rights reserved.
//

import Foundation
import UIKit


//ApiKey: EMiwdUfsgsZdUSZELZjJeR72wBA4KoFy

struct BookWrapper : Decodable {
    let results: Quals
}


struct Quals : Decodable {
    let books : [Book]
}

struct Book : Decodable {
    let publisher : String
    let description : String
    let title : String
    let author : String
}


struct BookRequest {
    var request : URLRequest
    init()
    {
        request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EMiwdUfsgsZdUSZELZjJeR72wBA4KoFy")!)
    }
    func load(withCompletion completion: @escaping (BookWrapper?) -> Void) {
        URLSession.shared.dataTask(with: self.request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(BookWrapper.self, from: data!)
                completion(responseModel)
            }
            catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
}

class BooksViewController: UIViewController {
    private var wrapper : BookWrapper?
    
    @IBOutlet weak var BookTitle: UILabel!
    @IBOutlet weak var Author: UILabel!
    @IBOutlet weak var Summary: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookRequest().load { [weak self] (result) in
            self?.wrapper = result
            let randBook = Int(arc4random_uniform(10))
            DispatchQueue.main.async {
                self?.BookTitle.text =  self?.wrapper?.results.books[randBook].title.capitalized
                self?.Author.text = self?.wrapper?.results.books[randBook].author
                self?.Summary.text = self?.wrapper?.results.books[randBook].description
            }
        }
    }
}




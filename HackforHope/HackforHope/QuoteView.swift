//
//  QuoteView.swift
//  HackforHope
//
//  Created by Kevin Sun on 4/17/20.
//  Copyright © 2020 Kevin Sun. All rights reserved.
//

import Foundation
import UIKit


struct Wrapper : Decodable {
    let contents : QuoteList
}

struct QuoteList : Decodable {
    let quotes : [Quote]
}

struct Quote : Decodable {
    let quote : String
    let author : String
}

struct QuoteRequest {
    var request : URLRequest
    init()
    {
        request = URLRequest(url: URL(string: "https://quotes.rest/qod")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("5ce3c2b119msh5b06e6c3d48b4a3p1efc88jsn3a7419a99dd2", forHTTPHeaderField: "X-TheySaidSo-Api-Secret")
      
    }
    func load(withCompletion completion: @escaping (Wrapper?) -> Void) {
        URLSession.shared.dataTask(with: self.request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Wrapper.self, from: data!)
                completion(responseModel)
            }
            catch {
                 print("JSON Serialization error")
            }
        }).resume()
    }
    
}


class QuotesViewController: UIViewController {
    private var quotes: Wrapper?
    
    @IBOutlet weak var DisplayQuote: UILabel!
    @IBOutlet weak var DisplayAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuoteRequest().load { [weak self] (quotes) in
            self?.quotes = quotes
            let quote = self?.quotes?.contents.quotes[0].quote
            let author = self?.quotes?.contents.quotes[0].author
            DispatchQueue.main.async {
                self?.DisplayQuote.text = quote
                self?.DisplayAuthor.text = author
            }
        }
    }
}



//
//  MovieView.swift
//  HackforHope
//
//  Created by Kevin Sun on 4/17/20.
//  Copyright © 2020 Kevin Sun. All rights reserved.
//

import Foundation
import UIKit


struct Result : Decodable {
    let results : [Movie]
}

struct Movie : Decodable {
    let vote_average : Double
    let title : String
    let release_date : String
    let overview : String
}

struct MovieRequest {
    var request : URLRequest
    init()
    {
        request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=c8ed1247289c37d1e848dbba0c2ba161")!)
    }
    func load(withCompletion completion: @escaping (Result?) -> Void) {
        URLSession.shared.dataTask(with: self.request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Result.self, from: data!)
                completion(responseModel)
            }
            catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
}

class MoviesViewController: UIViewController {
    private var results : Result?

    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var Release: UILabel!
    @IBOutlet weak var Summary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieRequest().load { [weak self] (result) in
            self?.results = result
            let randMovie = Int(arc4random_uniform(10))
            print("hi")
            DispatchQueue.main.async {
                self?.MovieTitle.text = self?.results?.results[randMovie].title
                let a:Double = self?.results?.results[randMovie].vote_average ?? 0
                self?.Rating.text = String(format:"%.1f", a)
                self?.Release.text = self?.results?.results[randMovie].release_date
                self?.Summary.text = self?.results?.results[randMovie].overview
            }
        }
    }
}


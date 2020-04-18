//
//  MainPage.swift
//  HackforHope
//
//  Created by Kevin Sun on 4/17/20.
//  Copyright © 2020 Kevin Sun. All rights reserved.
//
import Foundation
import UIKit


class SecondViewController : UIViewController {
    
    @IBOutlet weak var BookLabel: UILabel!
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var FilmLabel: UILabel!
    @IBOutlet weak var DiscussionLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BookLabel.layer.cornerRadius = BookLabel.frame.height / 2
        BookLabel.backgroundColor = UIColor.blue
        BookLabel.clipsToBounds = true
        BookLabel.tintColor = UIColor.white

        
        QuoteLabel.layer.cornerRadius = QuoteLabel.frame.height / 2
        QuoteLabel.backgroundColor = UIColor.blue
        QuoteLabel.clipsToBounds = true
        QuoteLabel.tintColor = UIColor.white

        FilmLabel.layer.cornerRadius = FilmLabel.frame.height / 2
        FilmLabel.backgroundColor = UIColor.blue
        FilmLabel.clipsToBounds = true
        FilmLabel.tintColor = UIColor.white

    
        DiscussionLabel.layer.cornerRadius = DiscussionLabel.frame.height / 2
        DiscussionLabel.backgroundColor = UIColor.blue
        DiscussionLabel.clipsToBounds = true
        DiscussionLabel.tintColor = UIColor.white

    
    }
}

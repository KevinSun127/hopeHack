//
//  ViewController.swift
//  HackforHope
//
//  Created by Kevin Sun on 4/17/20.
//  Copyright © 2020 Kevin Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var uscId: UIButton!
    @IBOutlet weak var login: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createAccount.layer.cornerRadius = createAccount.frame.height / 2
        createAccount.backgroundColor = UIColor.blue
        createAccount.clipsToBounds = true
        createAccount.tintColor = UIColor.white
        createAccount.setTitle("Create free account", for: .normal)
        createAccount.setTitleColor(.white, for: .normal)
        
        uscId.layer.cornerRadius = createAccount.frame.height / 2
        uscId.backgroundColor = UIColor.blue
        uscId.clipsToBounds = true
        uscId.tintColor = UIColor.white
        uscId.setTitle("Connect with USC ID", for: .normal)
        uscId.setTitleColor(.white, for: .normal)
        
        login.layer.cornerRadius = createAccount.frame.height / 2
        login.backgroundColor = UIColor.blue
        login.clipsToBounds = true
        login.tintColor = UIColor.white
        login.setTitle("Login", for: .normal)
        login.setTitleColor(.white, for: .normal)
        
        
    }
    
    
    
    //MARK: Actions

    
    
}


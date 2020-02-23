//
//  ViewController.swift
//  Shamaz
//
//  Created by Gabriel Balta on 21/02/2020.
//  Copyright © 2020 Gabriel Balta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Navigation bar textAttributes change, before view is on screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 50)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }


}

